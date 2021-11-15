source 'https://rubygems.org'

gem 'activerecord'
gem 'pg'
gem 'sinatra'
gem 'sinatra-activerecord' # excellent gem that ports ActiveRecord for Sinatra
gem 'rake'
gem 'tux'
gem 'shotgun'

group :test do
  gem "rspec"
  gem "rack-test"
  gem "capybara"

end

gem "json"
gem 'simplecov', require: false, group: :test

group :test do
  gem 'database_cleaner-active_record'
end

group :development, :test do
  gem 'rubocop', require: false
end
