class ArticleSearchJob < ActiveJob::Base
  queue_as :default

  def perform(admin_search)
    search_results = SearchResults.new.parse(Search.new.find_all(admin_search.keywords.split(',')))
    store_results(search_results, admin_search.id)
  end

  private
  def store_results(results, admin_search_id)
    results.each do |result|
      store_result(result, admin_search_id)
    end
  end

  def store_result(result, admin_search_id)
    AdminArticle.create(url: result[:final_url], content: result[:text], title: result[:title], performance_score: result[:performance_score], spam_score: result[:spam_score], admin_search_id: admin_search_id, content: result[:text])
  end

end
