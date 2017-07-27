# Link class (links table) holds data for each link
# One link can have multiple tags (Tag class, tags table)
class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
end
