source "https://rubygems.org"
ruby "~> 2.5.0"

# application server
gem "rails", "~> 5.1.5"

# database
gem "pg"

# web server
gem "puma"
gem "rack-timeout"

# assets: css / js
gem "sass-rails"
gem "autoprefixer-rails"
gem "uglifier"
gem "coffee-rails"
gem "jquery-rails"

# auth
gem "bcrypt", "~> 3.1"
gem "omniauth"
gem "omniauth-twitter"

# pagination
gem "will_paginate"

# auto-linking @usernames and #hashtags
gem "twitter-text"

# activities units conversion
gem "ruby-units"

# syndication
gem "twitter"

# testing
group :development, :test do
  gem "rspec-rails"
  gem "codeclimate-test-reporter", require: false
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # For measuring page/code performance
  gem "rack-mini-profiler"

  # For memory profiling
  gem "memory_profiler"

  # For call-stack profiling flamegraphs
  gem "flamegraph"
  gem "stackprof"
  gem "fast_stack"
end

# development only
group :development do
  gem "byebug"
  gem "web-console"
  gem "rubocop", require: false
  gem "grailbird_updater"
end

# windows dev
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
