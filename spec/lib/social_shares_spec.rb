require 'rails_helper'
require 'social_shares'

describe SocialShares, :vcr do
  before(:each) do
    @url = "https://blog.kissmetrics.com/use-kissmetrics-discover-freemium-value/"
    @facebook_xml = '<links_getStats_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">
  <link_stat>
    <url>http://tmagazine.blogs.nytimes.com/category/womens-fashion/</url>
    <normalized_url>http://tmagazine.blogs.nytimes.com/category/womens-fashion/</normalized_url>
    <share_count>62</share_count>
    <like_count>49</like_count>
    <comment_count>26</comment_count>
    <total_count>137</total_count>
    <click_count>0</click_count>
    <comments_fbid>10150206269948436</comments_fbid>
    <commentsbox_count>0</commentsbox_count>
  </link_stat>
</links_getStats_response>'
  end

  it "should get the share count for a given url" do
    #shares = SocialShares.new({url: @url}).all
    #expect(shares[:facebook]).to eq 54
  end

  it "should parse a facebook share count xml document" do
    shares = SocialShares.new({url: "http://tmagazine.blogs.nytimes.com/category/womens-fashion/"}).send(:shares_from_facebook_xml, @facebook_xml)
    expect(shares).to eq 62
  end

  it "should get the facebook shares using facebook" do
    shares = SocialShares.new({url: "http://tmagazine.blogs.nytimes.com/category/womens-fashion/"}).send(:get_shares_through_facebook)
    expect(shares).to eq 62
  end

end