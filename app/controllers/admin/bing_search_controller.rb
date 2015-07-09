class Admin::BingSearchController < Dashboard::ApplicationController
  def index
  end

  def create
    AdminSearch.create(keywords: params[:keywords], search_type: "bing_search")
    redirect_to "/admin/bing_search/searches"
  end

  def searches
    @admin_searches = AdminSearch.where(search_type: 'bing_search')
  end

  def results
    @search_results = AdminArticle.where(admin_search_id: params[:admin_search_id])
  end

end
