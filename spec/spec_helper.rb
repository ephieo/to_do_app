require 'simplecov'
SimpleCov.start

ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)

require File.expand_path('../../config/environment.rb', __FILE__)

require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
