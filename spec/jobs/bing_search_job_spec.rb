require 'rails_helper'

RSpec.describe BingSearchJob, :vcr, type: :job do

  it "should search for a given keyword" do
    bing_search_job = BingSearchJob.new
    bing_search_job.send(:get_articles, {keyword: "growth hacking"})
  end

end
