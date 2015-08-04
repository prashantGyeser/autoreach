class Dashboard::ArchiveController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id).where(irrelevant: false).where.not(facebook_shares: nil).where("facebook_shares > 0").order('keyword DESC').order( 'facebook_shares DESC' ).page(params[:page])
  end
end
