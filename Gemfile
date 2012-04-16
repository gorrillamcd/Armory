source 'https://rubygems.org'
gem 'rails', '3.2.1'
gem 'mysql2'
gem 'json'
gem 'jquery-rails'
gem 'thin'

gem 'paperclip'
gem 'simple_form'

# Authentication and Authorization
gem 'devise'
gem 'cancan'
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
    gem 'libnotify' # for linux notifications
    # gem 'growl' # For Mac growl notifications
end

gem 'cucumber-rails', :group => :test

group :development, :test do
    gem 'capybara'
    gem 'launchy'
    gem 'factory_girl_rails'
    gem 'rspec-rails'

    # Gem related to guard
    gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i#only include gem if on OS10(Mac)
    gem 'guard-rspec'
    gem 'guard-cucumber'
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