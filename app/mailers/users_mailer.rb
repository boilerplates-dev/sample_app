class UsersMailer < ApplicationMailer
  default from: 'no-reply@sample.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Sample App')
  end
end
