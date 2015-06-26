class UserSearch

  def all

  end

  private
  def users
    User.find_each do |user|
      user(user)
    end
  end

  def user(user)
    user_keywords(user)

  end

  def user_keywords(user)
    user.user_keywords.pluck(:keyword)
  end

  def search(keywords)
    Search.find_all(keywords)
  end


end