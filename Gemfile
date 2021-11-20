source 'https://rubygems.org'

gem 'activerecord'
gem 'sinatra'
gem 'sinatra-activerecord' 
gem 'rake'
gem 'tux'
gem 'rack'

group :development, :test do
  gem "rerun"
end

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

gem "puma", "~> 5.5"
