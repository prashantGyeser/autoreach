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

FactoryGirl.define do
  factory :user_tweet do
    tweet Faker::Lorem.sentence
    token_id 1
  end

end
