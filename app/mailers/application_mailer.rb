class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@sample.com'

  layout 'mailer'
end
