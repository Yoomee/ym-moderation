ENV["RAILS_ENV"] ||= 'test'
require "#{File.dirname(__FILE__)}/../test/dummy/config/environment"
require 'ym_core/spec_helper'
require 'capybara-webkit'
require 'database_cleaner'

Capybara.javascript_driver = :webkit

FactoryGirl.reload

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end