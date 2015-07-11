require 'rails_helper'

RSpec.describe BingSearchWithUrlCheckJob, :vcr, type: :job do

  before do
    @bing_search_with_url_check_job = BingSearchWithUrlCheckJob.new
    @search_results = @bing_search_with_url_check_job.send(:search, {keyword: "growth hacking"})
  end

  it "should search and return all the articles" do
    parsed_results = @bing_search_with_url_check_job.send(:parse, @search_results[:results])
    expect(parsed_results.count).to eq 50
  end

  it "should store the parsed articles" do
    parsed_results = @bing_search_with_url_check_job.send(:parse, @search_results[:results])
    non_articles_removed = @bing_search_with_url_check_job.send(:remove_non_articles, parsed_results)
    expect(non_articles_removed.count).to eq 38
  end

  it "should store the facebook shares for the urls" do
    parsed_results = @bing_search_with_url_check_job.send(:parse, @search_results[:results])
    non_articles_removed = @bing_search_with_url_check_job.send(:remove_non_articles, parsed_results)
    @bing_search_with_url_check_job.send(:store_articles, non_articles_removed,{keyword: "growth hacking"}, 1)
    expect(AdminArticle.where.not(facebook_shares: nil).count).to eq 37
  end

end
