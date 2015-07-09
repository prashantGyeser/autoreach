class BingSearchWithUrlCheckJob < ActiveJob::Base
  queue_as :default

  def perform(keyword, admin_search_id)
    search_results = search(keyword)
    parsed_results = parse(search_results[:results])
    parsed_results = remove_non_articles(parsed_results)
    admin_article = store_articles(parsed_results, keyword, admin_search_id)
    set_facebook_shares(admin_article)
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
      if is_article?(result[:final_url]) == false
        parsed_results.delete_at(index)
      end
    end
    return parsed_results
  end

  def is_article?(url)
    Webpage.new({url: url}).contains_article?
  end

  def store_articles(results, keyword, admin_search_id)
    results.each do |result|
      store_article(result, keyword, admin_search_id)
    end
  end

  def store_article(result, keyword, admin_search_id)
    AdminArticle.create(url: result[:final_url], description: result[:description], title: result[:title], admin_search_id: admin_search_id)
  end

  def set_facebook_shares(admin_article)
    begin
      shares = ArticleQuality.new.facebook_shares({url: admin_article[:url]})
      admin_article[:facebook_shares] = shares
    rescue => e
      Rails.logger.error { "Encountered an error when trying to get the facebook shares: #{url}, #{e.message} #{e.backtrace.join("\n")}" }
    end

  end

end
