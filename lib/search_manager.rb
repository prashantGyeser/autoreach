class SearchManager
  attr_accessor :user_keyword, :bing_search

  def initialize(args)
    @user_keyword = args[:user_keyword]
    @bing_search = SearchBing.new({query: user_keyword[:keyword]})
  end

  def get_articles

    store_articles(search_bing)

    # webhose_results = search_webhose
    # puts "Total webhost results: #{webhose_results.count}"
    # if webhose_results.count <= 0
    #   store_articles(search_bing)
    # else
    #   store_articles(webhose_results)
    # end

  end

  private

  def search_webhose
    Search.new({search_term: user_keyword[:keyword]}).find
  end


  # Todo: Add the search logic here
  # Right now this is a simple search using Bing and only gets the first 50 results.
  # Need to upgrade it so that it can get more than the first 50 results or uses some other service to get more results
  def search_bing
    search_results = bing_search.first_50
    #set_reports
    return search_results
  end


  def store_articles(results)
    results.each do |result|
      store_article(result)
    end
  end

  def store_article(result)
    article = Article.new(url: result[:final_url], description: result[:description], title: result[:title], user_keyword_id: user_keyword[:id], user_id: user_keyword[:user_id], content: result[:text], performance_score: result[:performance_score], spam_score: result[:spam_score])

    if article.save
      return article
    else
      Rollbar.warning("Encountered an error when trying to save the article: #{result[:final_url]}, #{article.errors.full_messages}")
      return false
    end
  end

  def set_reports
    #user_keyword.total_results_in_last_search = bing_search.total_results_returned
    #user_keyword.save
  end

end