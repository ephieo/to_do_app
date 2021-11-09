source 'https://rubygems.org'

gem 'activerecord'
gem 'pg'
gem 'sinatra'
gem 'sinatra-activerecord' # excellent gem that ports ActiveRecord for Sinatra
gem 'rake'

group :test do
  gem "rspec"
  gem "rack-test"
end

gem 'simplecov', require: false, group: :test

group :development, :test do
  gem 'rubocop', require: false
end
