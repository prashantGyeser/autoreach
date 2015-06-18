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

FactoryGirl.define do
  factory :token do
    provider "MyString"
uid "MyString"
name "MyString"
username "MyString"
profile_picture "MyString"
user_id 1
  end

end
