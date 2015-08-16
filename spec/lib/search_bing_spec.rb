require 'rails_helper'
require 'search_bing'

describe SearchBing, :vcr do

  it "should get the first set of results given a valid query" do
    args = {query: "social media marketing"}
    results = SearchBing.new(args).first_50
    expect(results.count).to eq 50
  end

  it "should get the results past the first page of results from Bing"


end