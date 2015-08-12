class PostArticleJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    user_keyword = user_keyword(user)
    post(article(user_keyword), user, hashtag(user_keyword.keyword))
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

  def post(article, user, hashtag)
    token = Token.where(user_id: user.id).where(provider: 'twitter').last
    post_to_twitter({url: article.url, title: article.title, hashtag: hashtag}, token)
  end

  def post_to_twitter(token, args)
    Post.new.twitter(token, args)
  end

  def hashtag(keyword)
    '#' + keyword.split.map(&:capitalize).join('')
  end

end
