# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap_form', '~> 4.0'
gem 'carrierwave', '~> 2.0'
gem 'chartkick'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'csv'
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'font-awesome-sass', '~> 5.11.2'
gem 'fullcalendar-rails'
gem 'gon'
gem 'haml-rails', '~> 2.0'
gem 'initial_avatar'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'momentjs-rails'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.1.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'hirb'
  gem 'hirb-unicode-steakknife', '~> 0.0.6'
  gem 'rack-mini-profiler'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'bullet'
  gem 'letter_opener_web'
  gem 'listen', '>= 2.7', '< 4.0'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'webdriver', require: !ENV['SELENIUM_REMOTE_URL']
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
