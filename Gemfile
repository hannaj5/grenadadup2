source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Decorator pattern gem
gem 'draper'

# Authentication
gem 'devise'

# Authorization
gem 'pundit'

# Active admin easy web pages
gem 'activeadmin', github: 'activeadmin'

# Uploads
gem "fog-aws"
gem 'carrierwave', '~> 1.0'

# Background processing of various thigns.
gem 'delayed_job'
gem 'daemons'
gem 'delayed_job_active_record'
# Delayed job web interface
gem 'delayed_job_web'
gem 'daemons'

# Versioning on models
gem 'paper_trail'
gem 'differ'

# Image manipulation
gem 'mini_magick'
gem 'rmagick'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Ruby style checker
gem 'rubocop', require: false

group :test do
  gem 'capybara' # For integration testing.
  gem 'selenium-webdriver' # Web page interaction
  gem 'webmock' # Allows mocking of web apis for instance
end

group :test, :development do
  gem 'database_cleaner'                  # Allows isolated testing of DB interactions.
  gem 'guard-rspec'                       # Integrate Guard with Rspec
  gem 'guard-spring'                      # Integrate Guard with Spring
  gem 'rspec-rails'                       # Rspec
  gem 'shoulda-matchers', '2.8.0'         # Really handy RSpec matchers not included with RSpec
  gem 'spring-commands-rspec', group: :development
end

# Installed outside of environments to allow access in production.
# If you don't want this just put it
# in group :development, :test
gem 'factory_girl_rails'                  # Creates factories for models
gem 'faker'                               # Handy for creating fake data

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the
  # background. Read     more:         https://github.com/rails/spring
  gem 'spring'
end

