# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  url                :string
#  content            :text
#  crawled_on         :datetime
#  user_keyword_id    :integer
#  site               :string
#  performance_score  :integer
#  spam_score         :float
#  title              :text
#  main_image         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  quality_score      :integer
#  twitter_shares     :integer
#  facebook_shares    :integer
#  google_plus_shares :integer
#  linkedin_shares    :integer
#  description        :text
#  irrelevant         :boolean          default(FALSE)
#  shares_low         :boolean          default(FALSE)
#  posted             :boolean          default(FALSE)
#  is_article         :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Article, type: :model do

  it "should check if the content has changed" do
    url = "http://yahoo.com/"
    article = Article.create(url: url, user_keyword_id: 1)
    article.user_keyword_id = 2
    article.save
  end

end
