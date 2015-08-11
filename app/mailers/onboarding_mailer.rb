class OnboardingMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Autoreach')
  end

end
