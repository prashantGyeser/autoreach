# == Schema Information
#
# Table name: admin_articles
#
#  id                :integer          not null, primary key
#  url               :string
#  content           :text
#  crawled_on        :datetime
#  admin_search_id   :integer
#  site              :string
#  performance_score :float
#  spam_score        :float
#  title             :text
#  main_image        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  description       :text
#  facebook_shares   :integer
#

FactoryGirl.define do
  factory :admin_article do
    url "MyString"
content "MyText"
crawled_on "2015-06-26 05:47:32"
admin_search_id 1
site "MyString"
performance_score 1.5
spam_score 1.5
title "MyText"
main_image "MyString"
  end

end
