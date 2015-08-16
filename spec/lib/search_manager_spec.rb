require 'rails_helper'
require 'search_manager'

describe SearchManager, :vcr do
  before(:each) do
    @user_keyword = UserKeyword.create(keyword: "social media marketing", user_id: 1)
  end

  it "should search and store articles" do
    SearchManager.new({user_keyword: @user_keyword}).get_articles
    expect(Article.count).to eq 50
    expect(Article.where(content: nil).count).to be 21
  end

end