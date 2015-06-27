class Admin::ArticleSearchController < Dashboard::ApplicationController
  def index
  end

  def searches
    @admin_searches = AdminSearch.order('created_at DESC').all
  end

  def create
    AdminSearch.create(keywords: params[:keywords])
    redirect_to "/admin/article_search/searches"
  end

  def results
    @search_results = AdminArticle.where(admin_search_id: params[:admin_search_id])
  end

end
