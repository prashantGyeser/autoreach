# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  def search_complete
    user = User.create(email: "prashant@urbanzeak.com", password: "password@123", password_confirmation: "password@123")
    user_keyword = UserKeyword.create(keyword: "growth hacking", user_id: user.id)

    NotificationMailer.search_complete(user, user_keyword)

  end

end
