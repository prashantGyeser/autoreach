class Dashboard::SearchController < Dashboard::ApplicationController
  def index
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
    end
  end
end
