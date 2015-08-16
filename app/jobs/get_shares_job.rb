class GetSharesJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    get_shares(article)
  end

  private
  def get_shares(article)
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

end
