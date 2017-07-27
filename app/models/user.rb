# User class (users table) holds data for each user
class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String
  property :password, String
end
