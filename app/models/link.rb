require 'data_mapper'
require 'dm-postgres-adapter'

# Link corresponds to the Link table in the database
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end

postgres_database = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
# Heroku created postgresql-amorphous-43858 as DATABASE_URL
DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres_database)
DataMapper.finalize
DataMapper.auto_upgrade!
