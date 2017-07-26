ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

# BookmarkManager is the controller
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/links' do
    @user = session[:email]
    @links = Link.all
    erb(:'links/index')
  end

  get '/signup' do
    erb(:'links/signup')
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tags].split.each do |tag_name|
      link.tags << Tag.first_or_create(name: tag_name)
    end
    link.save
    redirect '/links'
  end

  post '/signup' do
    # What if the email already exists?
    User.create(email: params[:email], password: params[:password])
    session[:email] = params[:email]
    redirect '/links'
  end

  run! if app_file == $PROGRAM_NAME
end
