class UsersMailerPreview < ActionMailer::Preview
  def welcome_email
    u = User.find_or_initialize_by(name: 'Huang Bin')
    UsersMailer.welcome_email(u)
  end
end
