class Dashboard::SetupController < Dashboard::ApplicationController
  skip_before_filter :check_setup

  def keywords
  end

  def processing

  end

  def create_keywords
    puts params[:keyword]
    create_keyword(params[:keyword])
    redirect_to dashboard_root_path
  end

  private
  def create_keyword(term)
    if term.present?
      UserKeyword.create(keyword: term, user_id: current_user.id, keyword_type: "user_created")
    end
  end

end
