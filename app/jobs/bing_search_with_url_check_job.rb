class BingSearchWithUrlCheckJob < ActiveJob::Base
  queue_as :default

  def perform(keyword, admin_search_id)
    search_results = search(keyword)
    parsed_results = parse(search_results[:results])
    parsed_results = remove_non_articles(parsed_results)
    store_articles(parsed_results, keyword, admin_search_id)

  end

  private
  def search(keyword)
    SearchBing.new.find_all(keyword[:keyword])
  end

  def parse(results)
    SearchResults.new.parse_bing(results)
  end

  def remove_non_articles(parsed_results)
    parsed_results.each_with_index do |result, index|
      webpage = webpage(result[:final_url])
      if webpage.contains_article?
        parsed_results[index][:content] = webpage.content
      else
        parsed_results.delete_at(index)
      end
    end
    return parsed_results
  end

  def webpage(url)
    Webpage.new({url: url})
  end

  def store_articles(results, keyword, admin_search_id)
    results.each do |result|
      admin_article = store_article(result, admin_search_id)
      if admin_article != false
        set_facebook_shares(admin_article)
      end
    end
  end

  def store_article(result, admin_search_id)
    admin_article = AdminArticle.new(url: result[:final_url], description: result[:description], title: result[:title], admin_search_id: admin_search_id)

    if result[:content]
      admin_article[:content] = result[:content]
    end

    if admin_article.save
      return admin_article
    else
      Rails.logger.error { "Encountered an error when trying to save the article: #{result[:final_url]}, #{admin_article.errors.full_messages}" }
      return false
    end

  end

  def set_facebook_shares(admin_article)
    begin
      shares = ArticleQuality.new.facebook_shares({url: admin_article.url})
      admin_article.facebook_shares = shares
      admin_article.save
    rescue => e
      Rails.logger.error { "Encountered an error when trying to get the facebook shares: #{admin_article.url}, #{e.message} #{e.backtrace.join("\n")}" }
    end
  end


end
