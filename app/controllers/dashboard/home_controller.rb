class Dashboard::HomeController < Dashboard::ApplicationController
  def index
    @user_keyword = UserKeyword.where(user_id: current_user.id).where(archived: false).last
    @articles = Article.where(user_keyword_id: @user_keyword.id).page(params[:page])


    if @articles.count > 0
      if @user_keyword.searched == true
        @has_articles = true
      else
        @processing = true
      end
    elsif UserKeyword.where(user_id: current_user.id).first[:searched] == false
      @processing = true
    elsif UserKeyword.where(user_id: current_user.id).last[:searched] == true
      @no_results = true
    else
      @changing_keyword = true
    end




    if Token.where(user_id: current_user.id).count <= 0
      @integration_incomplete = true
    end

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

  def delete_article
    article = Article.find(params[:article_id])
    article.mark_as_irrelevant

    respond_to do |format|
      format.json { render json: article }
    end

  end

  def search_status
    keyword = UserKeyword.find(params[:keyword_id])

    respond_to do |format|
      format.json { render json: {search_complete: keyword.searched} }
    end

  end

end
