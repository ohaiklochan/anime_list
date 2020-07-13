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
  
  get "/animelist/:id" do
    if @animelist = AnimeList.find_by_id(params[:id])
     # binding.pry
    erb :"/animelist/show"
    else  
      redirect to '/'
    end
  end
    
    
  get "/animelist/:id/edit" do
    if logged_in?
    @animelist = AnimeList.find_by_id(params[:id])
    erb :"/animelist/edit"
    else
      redirect to '/'
    end
  end
    
  patch "/animelist/:id" do
  @animelist = AnimeList.find_by_id(params[:id])
  #binding.pry
  if logged_in? && @animelist.user_id == current_user.id 
    @animelist.update(params[:animelist])
    redirect "/animelist/#{@animelist.id}"
  else
    redirect "/animelist/new"
  end
end
    
      
  delete "/animelist/:id" do
    if logged_in?
      @animelist = AnimeList.find_by_id(params[:id]) 
    if @animelist.user == current_user
      @animelist.destroy
      redirect to "/users/#{current_user.id}"
    end
    else
      redirect to '/'
    end
  end
    
  helpers do 
    def logged_in? 
      !!session[:user_id]
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
