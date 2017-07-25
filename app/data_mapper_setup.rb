require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/link'
require_relative 'models/tag'

postgres_database = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
# Heroku created postgresql-amorphous-43858 as DATABASE_URL

DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres_database)
DataMapper.finalize
DataMapper.auto_upgrade!
