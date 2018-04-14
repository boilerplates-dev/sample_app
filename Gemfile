source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.0'

# ActiveRecord Helper
gem 'active_record_union'

# Use Postgres as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Pagination
gem 'kaminari'

# Displaying times and dates
gem 'local_time'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# User Twitter Bootstrap
gem 'bootstrap-sass'

# Create forms
gem 'simple_form'

# Encrypted Password
gem 'bcrypt'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Upload files
gem 'mini_magick'

# Amazon
gem 'aws-sdk-rails'
gem 'aws-sdk-s3'

# Monitor
gem 'health_check'
gem 'newrelic_rpm'

# Taming Rails' Default Request Logging
gem 'lograge'

# dotenv files
gem 'dotenv-rails'

# Backgound Jobs
gem 'sidekiq'

# Cron Jobs
gem 'whenever', require: false

# CORS
gem 'rack-cors', require: 'rack/cors'

# Email Helpers
gem 'ahoy_email' # Email tracking
gem 'mailkick' # Email subscriptions

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'faker'
end

group :development do
  gem 'stackprof'
  gem 'flamegraph'
  gem 'rack-mini-profiler'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'pry-rails'
  gem 'hirb'
  gem 'coolline'
  gem 'awesome_print'

  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-sidekiq'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end
