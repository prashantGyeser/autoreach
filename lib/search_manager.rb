class SearchManager
  attr_accessor :user_keyword, :bing_search

  def initialize(args)
    @user_keyword = args[:user_keyword]
    @bing_search = SearchBing.new({query: user_keyword[:keyword]})
  end

  def get_articles
    search_logic
  end

  private
  def search_bing(offset)
    # Todo: Add the offset here
    search_results = bing_search.find_with_offset(offset)
    return search_results
  end


  def store_articles(results)
    articles_saved = 0
    results.each do |result|
      article = store_article(result)
      if article != false
        articles_saved = articles_saved + 1
      end
    end
    return articles_saved
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

  # Todo: Change the name. This one is here till I can find a better name
  def search_logic

    # Search bing first with no offset. This is to make sure there are no new results
    # Count the results that are stored i.e. articles saved
      # IF the count is == 50
      # Break out of this system
      # ELSE
      # Rerun search till a total of 50 new results are go using this search call


    get_new_articles
    SetAllArticleDetailsJob.perform_later
  end

  def get_new_articles

    articles_count = store_articles(search_bing(0))

    # Todo: Account for cases where the search result is less than 50. Currently it will go into an infinite loop if there are less than 50 results
    if articles_count != 50
      get_articles_with_offset(articles_count)
    end


  end

  def get_articles_with_offset(current_new_article_count)
    total_new_articles = current_new_article_count
    while total_new_articles < 50
      search_results = search_bing(offset)
      # Getting 50 results with each search so increasing the offset by 50 each time
      set_keyword_offset(50 + user_keyword.offset)
      articles_count = store_articles(search_results)
      total_new_articles =  articles_count + total_new_articles
    end
  end


  def offset
    user_keyword.offset
  end

  def set_keyword_offset(offset)
    user_keyword.set_offset(offset)
  end


end