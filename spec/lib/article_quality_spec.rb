require 'rails_helper'
require 'article_quality'

describe ArticleQuality do


  before(:each) do
    @keyword = {id: 1}
    i = 0
    while i < 10
      Article.create(facebook_shares: rand(100..1000), url: "yahoo.com/#{i}", user_id: 1, keyword_id: 1)
      i = i+1
    end
  end

  it "should return a article list sorted by share count" do
    results = ArticleQuality.new.send(:order_by_shares, Article.all)
  end

  it "should mark the bottom 20 percent of the articles as non performing" do
    ArticleQuality.new.eliminate_least_shared(@keyword)
    expect(Article.where(shares_low: true).count).to eq 2
  end

end