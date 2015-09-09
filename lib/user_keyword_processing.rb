class UserKeywordProcessing
  attr_accessor :user_keyword

  def initialize(args)
    @user_keyword = args[:user_keyword]
  end


  def is_complete?
    articles = user_keyword.articles
    processed_articles = articles.where('content_tries > 0 AND shares_tries > 0')
    if articles.count == processed_articles.count
      return true
    end
    return false
  end

end