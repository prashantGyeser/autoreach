class Post

  def twitter(twitter_credentials, url)
    twitter_client = TwitterClient.initialize_client(twitter_credentials)
    twitter_client.update(generate_twitter_message(url))
  end

  def facebook(token, message)

  end

  private
  def generate_twitter_message(url)
    url_summary = Summary.new.url(url)
    url_summary.truncate(summary_length_twitter(url)) + ' ' + url
  end

  def summary_length_twitter(url)
    url_length = url.length
    # A message can be a maximum of 140 characters in length
    # Setting it to 125 here to account for any additional spaces that might be added in the message
    return (125 - url_length)
  end

end