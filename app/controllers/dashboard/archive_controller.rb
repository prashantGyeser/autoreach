class Dashboard::ArchiveController < Dashboard::ApplicationController
  def index

    @user_keywords = UserKeyword.where(user_id: current_user.id).where(archived: true).includes(:articles).where(:articles => {irrelevant: false}).where.not(articles: {facebook_shares: nil}).order( 'facebook_shares DESC' ).page(params[:page])

    #@articles = Article.where(user_id: current_user.id).where(irrelevant: false).where.not(facebook_shares: nil).where("facebook_shares > 0").order('keyword DESC').order( 'facebook_shares DESC' ).page(params[:page])
  end
end
