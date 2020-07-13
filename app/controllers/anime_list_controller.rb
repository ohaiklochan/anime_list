class AnimeListController < ApplicationController

  get "/animelist" do
    if logged_in?
    @animelist = AnimeList.all
    erb :"/animelist/index"
    else  
      redirect to '/'
    end
  end
    
    
  get "/animelist/new" do
    if logged_in?
    erb :"/animelist/create"
    else  
      redirect to '/'
    end
  end
    
    
  post "/animelist" do
    if params[:name].empty? || params[:genre].empty? || params[:classification].empty?
      redirect to '/animelist/new'
    end 
      if logged_in?
        animelist = AnimeList.create(params)
        animelist.user_id = current_user.id
        animelist.save
        redirect "/animelist/#{animelist.id}"
      end
    end
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
    @animelist.update(anime_lists: params[:anime_lists])
    redirect "/animelist/#{@animelist.id}"
  else
    redirect "/animelist/new"
  end
    
      
  delete "/animelist/:id" do
    if logged_in?
      @animelist = AnimeList.find_by_id(params[:id]) 
    if @animelist.user == current_user
      @animelist.clear
      redirect to "/users/#{current_user.id}"
    end
    else
      redirect to '/'
    end
  end
end 