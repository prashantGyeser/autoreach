class ArticleDetails
  attr_accessor :article, :url, :webpage

  def initialize(args)
    @article = args[:article]
    @url = article[:url]
    @webpage = Webpage.new({url: url})
  end

  def set_details
    if article.content.nil? && ( article.content_tries < 3 )
      set_content
      set_shares
    elsif article.facebook_shares.nil? && ( article.shares_tries < 3 )
      set_shares
    end
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

end