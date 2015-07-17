class Dashboard::ApplicationController < ActionController::Base
  layout "dashboard/application"
  before_action :authenticate_user!

  before_filter :check_setup

  private
  def check_setup
    if UserKeyword.where(user_id: current_user.id).count <= 0
      redirect_to dashboard_setup_keywords_path
    end
  end

end