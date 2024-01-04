source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 7.0.0'
gem "sprockets-rails"
gem 'jquery-rails'
gem 'dotenv-rails', groups: [:development, :test]
gem 'stripe'
gem "money-rails"
gem 'friendly_id', '~> 5.4.0'
gem 'pg'
gem 'puma'
gem "importmap-rails"
gem "turbo-rails", '~> 1.0.0'
gem "stimulus-rails"
gem 'jbuilder'
gem 'material_icons'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem "aws-sdk-s3", require: false
gem 'bootsnap', require: false
gem 'devise'

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

group :development, :test do
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    gem 'pry'
    gem 'rspec'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "dockerfile-rails", ">= 1.5", :group => :development
