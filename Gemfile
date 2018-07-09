source 'https://rubygems.org'
ruby '~> 2.5.1'

# application server
gem 'rails', '~> 5.2.0'

# database
gem 'pg'

# web server
gem 'puma'
# gem 'rack-timeout'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# assets: css / js
gem 'autoprefixer-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'sass-rails'
gem 'uglifier'

# auth
gem 'bcrypt', '~> 3.1'
gem 'omniauth'
gem 'omniauth-twitter'

# pagination
gem 'will_paginate'

# auto-linking @usernames and #hashtags
gem 'twitter-text'

# activities units conversion
gem 'ruby-units'

# syndication
gem 'twitter'

# testing
group :development, :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'listen'
  gem 'overcommit'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # For measuring page/code performance
  gem 'rack-mini-profiler'

  # For memory profiling
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs
  gem 'fast_stack'
  gem 'flamegraph'
  gem 'stackprof'
end

# development only
group :development do
  gem 'byebug'
  gem 'grailbird_updater'
  gem 'rubocop', require: false
  gem 'web-console'
end

# windows dev
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
