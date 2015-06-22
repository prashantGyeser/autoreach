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

require 'rails_helper'

RSpec.describe UserTweet, type: :model do

  before do
    @tweets = [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence]
    @token_id = 1
  end

  it "stores a tweet" do
    UserTweet.save_tweets(@tweets, @token_id)
    expect(UserTweet.count).to eq 3
  end

end
