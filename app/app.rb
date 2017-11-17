require 'sinatra/base'
require_relative 'models/db-setup'
require_relative 'models/user'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'narcissus'

  helpers do 
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb(:'auth/signup')
  end

  post '/users/new' do
    user = User.new(name: params[:name], password: params[:password],
                    email: params[:email], handle: params[:handle])
    redirect('/users/new') unless user.save
    session[:user_id] = user.id
    redirect('/peeps')
  end

  get '/peeps' do
    erb(:'/peeps/peeps')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content], user: current_user)
    redirect('/peeps')
  end
end
