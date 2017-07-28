ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'database_cleaner'
require_relative 'helpers/session'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include SessionHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
