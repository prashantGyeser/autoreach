# == Schema Information
#
# Table name: tokens
#
#  id              :integer          not null, primary key
#  provider        :string
#  uid             :string
#  name            :string
#  username        :string
#  profile_picture :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  oauth_token     :string
#  oauth_secret    :string
#

class Token < ActiveRecord::Base
  belongs_to :user
  has_many :user_tweets
  has_many :user_keywords

  #after_create :set_keywords

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, user_id: auth.user_id).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |token|
      token.provider = auth['provider']
      token.uid = auth['uid']
      token.oauth_token = auth['credentials']['token']
      token.oauth_secret = auth['credentials']['secret']
      token.name = auth['info']['name'] || nil
      token.username = auth['info']['nickname']
      token.profile_picture = auth['info']['image']
      token.user_id = auth['user_id']
    end
  end

  def set_keywords
    recent_tweets = TwitterUser.new(self).recent_tweets(self.username)
    parsed_tweets = Tweets.new.parse(recent_tweets)
    UserTweet.save_tweets(parsed_tweets, self.id)
    UserKeyword.generate_keywords(self.id)
  end

end
