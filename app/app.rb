ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

# BookmarkManager is the controller
class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/sessions/new'
  end

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/users/new' do
    @user = User.new
    erb(:'links/signup')
  end

  get '/sessions/new' do
    erb(:'links/signin')
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

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.valid?
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'/links/signup')
    end
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'/links/signup')
    end
  end

  run! if app_file == $PROGRAM_NAME
end
