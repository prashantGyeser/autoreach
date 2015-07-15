class BingSearchJob < ActiveJob::Base
  queue_as :default

  def perform(keyword)
    search_results = search(keyword)
    parsed_results = parse(search_results[:results])
    parsed_results = remove_non_articles(parsed_results)
    store_articles(parsed_results, keyword)
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

  def store_articles(results, keyword)
    results.each do |result|
      article = store_article(result, keyword)
      if article != false
        set_facebook_shares(article)
      end
    end
  end

  def store_article(result, keyword)
    article = Article.new(url: result[:final_url], description: result[:description], title: result[:title], keyword_id: keyword[:id], user_id: keyword[:user_id])

    if result[:content]
      article[:content] = result[:content]
    end

    if article.save
      return article
    else
      Rails.logger.error { "Encountered an error when trying to save the article: #{result[:final_url]}, #{article.errors.full_messages}" }
      return false
    end

  end

  def set_facebook_shares(article)
    begin
      shares = ArticleQuality.new.facebook_shares({url: article.url})
      article.facebook_shares = shares
      article.save
    rescue => e
      Rails.logger.error { "Encountered an error when trying to get the facebook shares: #{article.url}, #{e.message} #{e.backtrace.join("\n")}" }
    end

  end
end
