class FindArticlesJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    articles = get_articles(get_user_keywords(user))
    store_articles(articles, user)
  end

  private
  def get_user_keywords(user)
    user.user_keywords.where(keyword_type: "user_created").pluck(:keyword)
  end

  def get_articles(keywords)
    SearchResults.new.parse(Search.new.find_all(keywords))
  end

  def store_articles(articles_hash, user)
    articles_hash.each do |article|
      store_article(article, user)
    end
  end

  def store_article(article, user)
    Article.create(url: article[:final_url], content: article[:text], title: article[:title], performance_score: article[:performance_score], spam_score: article[:spam_score], user_id: user.id)
  end

end
