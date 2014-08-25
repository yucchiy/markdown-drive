source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'omniauth'
gem 'omniauth-dropbox-oauth2'
gem 'omniauth-twitter'

gem 'sqlite3', :group => :development
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 2.0'
gem 'spring',        group: :development

gem "rails-erd", group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test, :production do
  gem 'pg'
end

group :production do
  gem 'rails_12factor'
end
