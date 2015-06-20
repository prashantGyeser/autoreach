class TwitterClient

  def self.initialize_client(twitter_credentials)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = twitter_credentials[:oauth_token]
      config.access_token_secret = twitter_credentials[:oauth_secret]
    end
  end

end