require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
      erb :welcome
  end

  get '/home' do
      authenticate
      erb :home
  end

  helpers do
    
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def authenticate
        if !logged_in?
            redirect '/login'
        else
            @user = current_user
            @user_anime_list = current_user.anime_list
        end
    end

    def authenticate_user(anime_list)
        redirect '/home' if !anime_list
        redirect '/home' if current_user != anime_list.user
    end
    
  end
end