source 'https://rubygems.org'
gem 'rails', '3.2.1'

gem 'json'
gem 'jquery-rails'

# gem 'mysql2'
gem 'pg'

gem 'unicorn'

gem 'capistrano'
gem 'rvm-capistrano'

gem 'paperclip'
gem 'simple_form'
gem 'high_voltage'
gem 'state_machine'
gem 'stripe'

# Authentication and Authorization
gem 'devise'
gem 'cancan'
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
  gem 'thin' # WEBbrick is too slow
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'libnotify' # for linux notifications
  # gem 'growl' # For Mac growl notifications
end

group :development, :test do
    gem 'capybara'
    gem 'factory_girl_rails'
    gem 'rspec-rails'
    gem 'forgery'

    # Gem related to guard
    gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i#only include gem if on OS10(Mac)
    gem 'guard-rspec'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'bootstrap-sass', '~> 2.0.0'
  gem 'uglifier', '>= 1.0.3'
end