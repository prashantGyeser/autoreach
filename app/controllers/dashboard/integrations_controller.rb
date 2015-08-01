class Dashboard::IntegrationsController < Dashboard::ApplicationController
  def index
    if Token.where(user_id: current_user.id).where(provider: 'facebook').count > 0
      @facebook_connected = true
    else
      @facebook_connected = false
    end

    if Token.where(user_id: current_user.id).where(provider: 'twitter').count > 0
      @twitter_connected = true
    else
      @twitter_connected = false
    end
  end
end
