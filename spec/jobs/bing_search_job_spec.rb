require 'rails_helper'

RSpec.describe BingSearchJob, :vcr, type: :job do

  before do
    @bing_search_job = BingSearchJob.new
    @keyword = {keyword: "social media marketing", user_id: 1, id: 1}
    @search_results = @bing_search_job.send(:search, @keyword)
    @user_keyword = UserKeyword.create(keyword: "social media marketing", user_id: 1)
  end

  it "should search and return all the articles" do
    parsed_results = @bing_search_job.send(:parse, @search_results[:results])
    expect(parsed_results.count).to eq 50
  end

  it "should store the parsed articles" do
    parsed_results = @bing_search_job.send(:parse, @search_results[:results])
    non_articles_removed = @bing_search_job.send(:remove_non_articles, parsed_results)
    expect(non_articles_removed.count).to eq 50
  end

  it "should store the facebook shares for the urls" do
    parsed_results = @bing_search_job.send(:parse, @search_results[:results])
    non_articles_removed = @bing_search_job.send(:remove_non_articles, parsed_results)
    @bing_search_job.send(:store_articles, non_articles_removed,@keyword)
    expect(Article.where.not(facebook_shares: nil).count).to eq 50
  end

  it "should set the last searched time for the keyword" do
    user_keyword = UserKeyword.create(keyword: "growth hacking", user_id: 1)
    #user_keyword.set
  end

  it "should search and store all the articles" do
    @bing_search_job.perform(@user_keyword)
    expect(Article.count).to eq 50
  end

end
