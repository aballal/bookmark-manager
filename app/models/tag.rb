# Tag class (tags table) holds data for each tag
# One tag can be applied to multiple links (Link class, links table)
class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, String
end
