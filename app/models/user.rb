require 'bcrypt'

# User class (users table) holds data for each user
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  attr_accessor :password_confirmation

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  private

  attr_reader :password
end
