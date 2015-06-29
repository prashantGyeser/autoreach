class Dashboard::HomeController < Dashboard::ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id)
  end
end
