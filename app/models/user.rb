require 'bcrypt'

# User class (users table) holds data for each user
class User
  include DataMapper::Resource

  property :id,               Serial
  property :email,            String
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
