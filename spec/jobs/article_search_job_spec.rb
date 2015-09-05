require 'rails_helper'

RSpec.describe ArticleSearchJob,:vcr, type: :job do

  before do
    @article_search_job = ArticleSearchJob.new
    @user_keyword = {keyword: "social media marketing", user_id: 1, id: 2}
  end

  # Deprecated: Code elimination? Using only bing for now.
  # it "should get the search results using webhost" do
  #   @article_search_job.send(:get_articles, @user_keyword)
  #   expect(Article.count).to eq 100
  #   expect(Article.last[:performance_score]).to be >= 0
  # end

end
