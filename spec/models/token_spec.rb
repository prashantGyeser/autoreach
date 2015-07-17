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

require 'rails_helper'

RSpec.describe Token, type: :model do


  # before do
  #   @oauth_token = '2328561949-HkHz8CPBK4nZX6sbKzngsksVk2mRPvOeBTWBu82'
  #   @oauth_secret = 'Zq29UeKf0b784hvQtxAvKiFQjs0QQ9Zg1pstzU9OGylwe'
  #   @name = 'UrbanZeak'
  #   @username = 'UrbanZeak'
  # end
  #
  # it "saves the users tweets after creating a token" do
  #   VCR.use_cassette "twitter_recent_tweets" do
  #     Token.create(oauth_token: @oauth_token, oauth_secret: @oauth_secret, user_id: 1)
  #   end
  # end

end
