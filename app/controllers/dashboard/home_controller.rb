class Dashboard::HomeController < Dashboard::ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id)
  end

  def edit_keyword
    UserKeyword.archive_all(current_user)
    # Todo: Store the keyword entered by the user
    user_keyword = UserKeyword.new(keyword: params[:keyword], user_id: current_user.id)

    respond_to do |format|
      if user_keyword.save
        format.json { render json: user_keyword }
      else
        format.json { render json: user_keyword, status: :unprocessable_entity }
      end
    end
  end

end
