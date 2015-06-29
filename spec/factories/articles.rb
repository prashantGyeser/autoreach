# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  url               :string
#  content           :text
#  crawled_on        :datetime
#  keyword_id        :integer
#  site              :string
#  performance_score :integer
#  spam_score        :float
#  title             :text
#  main_image        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

FactoryGirl.define do
  factory :article do
    url "MyString"
content "MyText"
crawled_on "2015-06-24 20:37:05"
keyword_id 1
site "MyString"
performance_score 1
spam_score 1.5
title "MyText"
main_image "MyString"
  end

end
