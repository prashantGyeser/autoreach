class ArticleSearchJob < ActiveJob::Base
  queue_as :default

  def perform(user_keyword)
    get_articles(user_keyword)
    mark_search_complete(user_keyword)
  end

  private
  def get_articles(user_keyword)
    SearchManager.new({user_keyword: user_keyword}).get_articles
  end

  def mark_search_complete(user_keyword)
    user_keyword.set_search_status
  end

end
