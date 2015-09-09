class ArticleDetails
  attr_accessor :article, :url, :webpage, :user_keyword_processing, :pusher_updates, :user_keyword

  def initialize(args)
    @article = args[:article]
    @user_keyword = UserKeyword.find(article.user_keyword_id)
    @url = article[:url]
    @webpage = Webpage.new({url: url})
    @user_keyword_processing = UserKeywordProcessing.new({user_keyword: user_keyword})
    @pusher_updates = PusherUpdates.new
  end

  def set_details
    if article.content.nil? && ( article.content_tries < 3 )
      set_content
      set_shares
    elsif article.facebook_shares.nil? && ( article.shares_tries < 3 )
      set_shares
    end

    send_notifications

  end

  private
  def set_content
    content = get_content
    if content
      store_content(content)
    end
    increment_content_tries
  end

  def set_shares
    if webpage.contains_article?
      get_shares
      PusherUpdates.new.send_article_to_frontend(article)
    end
    increment_shares_tries
  end

  def get_content
    Scraper.new.scrape_page(url)
  end

  def store_content(content)
    article.content = content
    article.save
  end

  def increment_content_tries
    article.content_tries = article.content_tries + 1
    article.save
  end

  def get_shares
    begin
      shares = SocialShares.new({url: article.url}).all
      article.facebook_shares = shares[:facebook]
      article.twitter_shares = shares[:twitter]
      article.google_plus_shares = shares[:google]
      article.linkedin_shares = shares[:linkedin]
      article.save
    rescue => e
      Rollbar.error(e, article: article)
    end
  end

  def increment_shares_tries
    article.shares_tries = article.shares_tries + 1
    article.save
  end

  def send_notifications
    if user_keyword_processing.is_complete? && !user_keyword.processing_complete
      puts "Okay it is complete"
      pusher_updates.processing_complete(user_keyword)
      user_keyword.set_processing_complete
    elsif !user_keyword_processing.is_complete? && !user_keyword.processing_complete
      puts "It is processing"
      pusher_updates.processing_in_progress(user_keyword)
    end
  end

end