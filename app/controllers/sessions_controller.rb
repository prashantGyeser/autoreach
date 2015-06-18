class SessionsController < ApplicationController

  def create
    env["omniauth.auth"]['user_id'] = current_user.id
    token = Token.from_omniauth(env["omniauth.auth"])
    redirect_to root_url, notice: "Successfully connected your Twitter account."
  end

end