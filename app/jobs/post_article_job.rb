class PostArticleJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    post(article(user_keyword(user)), user)
  end

  private
  # Get the keyword
  # Get the next highest rated article
  # Post to all networks that have been integrated
  def user_keyword(user)
    UserKeyword.where(user_id: user.id).where(archived: false).last
  end

  def article(user_keyword)
    Article.where(user_keyword_id: user_keyword.id).where(posted: false).order("facebook_shares DESC").first
  end

  def post(article, user)
    token = Token.where(user_id: user.id).where(provider: 'twitter').last
    post_to_twitter(article.url, token)
  end

  def post_to_twitter(url, token)
    Post.new.twitter(token, url)
  end

end
