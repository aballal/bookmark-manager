# Controller for tags paths
class BookmarkManager < Sinatra::Base
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end
end
