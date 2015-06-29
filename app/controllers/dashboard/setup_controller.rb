class Dashboard::SetupController < Dashboard::ApplicationController
  def keywords
  end

  def processing

  end

  def create_keywords
    iterate_keywords(params[:keywords])
    FindArticlesJob.perform_later(current_user)
    redirect_to "/dashboard/setup/processing"
  end

  private
  def iterate_keywords(keywords)
    keywords.each do |keyword|
      create_keyword(keyword)
    end
  end

  def create_keyword(term)
    if term.present?
      UserKeyword.create(keyword: term, user_id: current_user.id, keyword_type: "user_created")
    end
  end

end
