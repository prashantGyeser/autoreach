# Preview all emails at http://localhost:3000/rails/mailers/onboarding_mailer
class OnboardingMailerPreview < ActionMailer::Preview

  def welcome
    user = User.create(email: "prashant@urbanzeak.com", password: "password@123", password_confirmation: "password@123")
    OnboardingMailer.welcome(user).deliver_now
  end

end
