ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'database_cleaner'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
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
