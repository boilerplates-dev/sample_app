ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'
ActionMailer::Base.smtp_settings = { address: 'smtp.mandrillapp.com',
                                     port: 587,
                                     enable_starttls_auto: true,
                                     user_name: ENV['MANDRILL_USER_NAME'],
                                     password: ENV['MANDRILL_PASSWORD'],
                                     authentication: :login }
ActionMailer::Base.default_url_options = { host: ENV['SERVER_NAME'] }
