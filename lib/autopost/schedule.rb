class Schedule

  def users
    User.find_each do |user|
      if not_posted?(user)
        post_article(user)
      end
    end
  end

  private
  def not_posted?(user)
    if TimeDifference.between(user.last_posted, DateTime.now.utc).in_hours > 12
      return true
    end
    return false
  end

  def post_article(user)
    PostArticleJob.perform_later user
  end

end