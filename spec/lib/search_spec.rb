require 'search'
require 'rails_helper'

describe Search, :vcr do

  before :each do
    @search = Search.new({search_term: "social media marketing"})
  end

  it "should return a proper webhost url" do
    url = @search.send(:generate_perfect_match_url, '"social media marketing"')
    expect(url).to eq 'https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=%22social%20media%20marketing%22&language=english&site_type=news&site_type=blogs'
  end

  it "should get results from webhose given a valid keyword" do
    results = @search.find
    expect(results.count).to be 100
  end


end