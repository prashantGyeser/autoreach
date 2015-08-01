class SessionsController < ApplicationController

  def create
    env["omniauth.auth"]['user_id'] = current_user.id
    token = Token.from_omniauth(env["omniauth.auth"])
    redirect_to dashboard_integrations_path, notice: "Successfully connected."
  end

end