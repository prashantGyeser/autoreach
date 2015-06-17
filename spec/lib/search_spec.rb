require 'search'
require 'rails_helper'

describe Search, :vcr do

  before :each do
    @search = Search.new
  end

  it "should let a user search for articles based on a keyword" do
    query = "keyword"
    @search.find_all(query)
  end

  it "should let a user search for articles based on multiple keywords"

  it "should encode a url properly" do
    encoded_url = @search.send(:encode_url, "www.test.com/q=a long query")
    expect(encoded_url).to eq "www.test.com/q=a%20long%20query"
  end

end