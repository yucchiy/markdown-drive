source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# ExecJS
gem 'libv8'
gem 'execjs'
gem 'therubyracer', :platforms => :ruby

# template engine
gem 'slim'

# authentication
gem 'omniauth'
gem 'omniauth-github'

gem 'validate_url'

gem 'octokit'

gem 'foundation-rails'

# Use postgresql as the database for Active Record
gem 'pg'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'oj'

gem 'sidekiq'

group :production do
# Use Unicorn as the app server
# gem 'unicorn'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'guard-rspec', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'


  # Using Rspec
  gem 'rspec-rails', '~> 3.0'

  gem 'factory_girl_rails'
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem 'faker'
end

