class Post

  def twitter(twitter_credentials, message)
    twitter_client = TwitterClient.initialize_client(twitter_credentials)
    twitter_client.update(message)
  end

  def facebook(token, message)

  end

end