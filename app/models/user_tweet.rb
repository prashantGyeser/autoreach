# == Schema Information
#
# Table name: user_tweets
#
#  id         :integer          not null, primary key
#  tweet      :text
#  token_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTweet < ActiveRecord::Base
  belongs_to :token

  def self.save_tweets(tweets, token_id)
    tweets.each do |tweet|
      save_tweet(tweet, token_id)
    end
  end

  def self.user_tweets(token_id)
    UserTweet.where(token_id: token_id)
  end

  # Todo: Find out why I cannot use a class method here
  def self.save_tweet(tweet, token_id)
    UserTweet.create(tweet: tweet, token_id: token_id)
  end

end
