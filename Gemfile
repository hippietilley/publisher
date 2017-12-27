source "https://rubygems.org"
ruby "~> 2.5.0"

# application server
gem "rails", "~> 4.2.10"

# auth
gem "bcrypt", "~> 3.1"
gem "omniauth"
gem "omniauth-twitter"

# pagination
gem "will_paginate"

# assets: css / js
gem "sass-rails"
gem "uglifier"
gem "coffee-rails"
gem "jquery-rails"

# auto-linking @usernames and #hashtags
gem "twitter-text"

# activities units conversion
gem "ruby-units"

# database
gem "pg"

# web server
# gem "secure_headers"
gem "puma"
gem "rack-timeout"

# syndication
gem "twitter"

# testing
group :development, :test do
  gem "rspec-rails"
  gem "codeclimate-test-reporter", require: false
end

# development only
group :development do
  gem "byebug"
  gem "web-console"
  gem "rubocop", require: false
  gem "grailbird_updater"
end

# heroku
group :production do
  gem "rails_12factor"
end
