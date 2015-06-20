class TwitterUser
  attr_reader :twitter_client

  def initialize(twitter_credentials)
    @twitter_client = TwitterClient.initialize_client(twitter_credentials)
  end

  def recent_tweets(username)
    twitter_client.user_timeline(username)
  end

end