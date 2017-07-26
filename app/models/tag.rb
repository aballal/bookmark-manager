# Tag corresponds to tags table in the database
class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, String
end
