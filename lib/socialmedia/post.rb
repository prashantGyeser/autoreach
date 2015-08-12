class Post

  def twitter(twitter_credentials, args)
    twitter_client = TwitterClient.initialize_client(twitter_credentials)
    twitter_client.update(generate_twitter_message(args[:url], args[:title], args[:hashtag]))
  end

  def facebook(token, message)

  end

  private
  def generate_twitter_message(url, title, hashtag)
    message = message(title, hashtag)
    message.truncate(summary_length_twitter(url)) + ' ' + url
  end

  def summary_length_twitter(url)
    url_length = url.length
    # A message can be a maximum of 140 characters in length
    # Setting it to 125 here to account for any additional spaces that might be added in the message
    return (125 - url_length)
  end

  def message(title, hashtag)
    hashtag + ' ' + title
  end

end