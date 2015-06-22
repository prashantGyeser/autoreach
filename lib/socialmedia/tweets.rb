class Tweets

  def parse(tweets)
    all(tweets)
  end

  private
  def all(tweets)
    parsed_tweets = []
    tweets.each do |tweet|
      parsed_tweets << single_tweet(tweet)
    end
    return parsed_tweets
  end

  def single_tweet(tweet)
    # Tweet
    parsed_tweet = {}
    parsed_tweet[:text] = tweet.full_text
  end

end