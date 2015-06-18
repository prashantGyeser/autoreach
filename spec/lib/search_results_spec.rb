require 'search_results'
require 'search'
require 'rails_helper'

describe SearchResults do

  before :each do
    @search_results = SearchResults.new
    @url_with_redirect = 'http://omgili.com/r/DyQaNGXlfMp4GkjqYwqUHVNTL0mtNeHucqWhgKphc_9OyE2MmC3wJMdZP4rkNJfCgpGMrPeEI3r040OjIEXg7aCaRFrXrMrG8d6n6q9D5aolQrQ4hDBfrNGP1awZJKJn9hubqgcRXQU-'
  end

  # Todo: Need to get this test to run with the calls to the external sites for the redirect url
  it "should parse the search results" do
    VCR.use_cassette('Search/should_let_a_user_search_for_articles_based_on_a_keyword') do
      query = "keyword"
      valid_search_results = Search.new.find_all(query)
      expect(@search_results.parse(valid_search_results).count).to eq 100
    end
  end

  it "should get the final url after a redirect" do
    VCR.use_cassette("SearchResults/follow_redirect") do
      final_url = @search_results.send(:get_final_url, @url_with_redirect)
      expect(final_url).to eq 'http://thenextweb.com/entrepreneur/2015/06/13/43-lessons-growing-from-0-to-1-million-in-revenue-twice/'
    end


  end

end