require 'rails_helper'
require 'social_shares'

describe SocialShares, :vcr do
  before(:each) do
    @url = "https://blog.kissmetrics.com/use-kissmetrics-discover-freemium-value/"
  end

  it "should get the share count for a given url" do
    shares = SocialShares.new({url: @url}).all
    expect(shares[:facebook]).to eq 54
  end

end