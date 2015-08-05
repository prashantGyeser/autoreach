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
#

require 'rails_helper'

RSpec.describe Article, type: :model do

  it "should not allow duplicate urls for a user" do
    url = "http://yahoo.com/"
    Article.create(url: url, user_id: 1)
    article = build(:article, url: url, user_id: 1)
    expect(article.errors[:url].size).to eq(1)
  end

end
