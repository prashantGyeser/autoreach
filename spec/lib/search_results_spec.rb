require 'search_results'
require 'search'
require 'rails_helper'

describe SearchResults do

  before :each do
    VCR.use_cassette('Search/should_let_a_user_search_for_articles_based_on_a_keyword') do
      query = "keyword"
      @valid_search_results = Search.new.find_all(query)
    end
    @search_results = SearchResults.new
  end

  it "should parse the search results" do
    @search_results.parse(@valid_search_results)
  end



end