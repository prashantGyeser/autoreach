class Dashboard::ApplicationController < ActionController::Base
  layout "dashboard/application"
  before_action :authenticate_user!
end