class NotificationMailer < ApplicationMailer

  def search_complete(user, user_keyword)
    @user = user
    @user_keyword = user_keyword
    mail(to: @user.email, subject: "#{user_keyword.keyword} search complete!")
  end

end
