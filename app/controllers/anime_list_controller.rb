class AnimeListController < ApplicationController

    get "/animelist" do
        if logged_in?
            @animelist = Animelist.all
            erb :"/animelist/index"
        else  
          redirect to '/'
        end
    end
    
    
      get "/animelist/new" do
        if logged_in?
            erb :"/animelist/new"
        else  
          redirect to '/'
        end
    end
    
    
    post "/animelist" do
        if params[:name].empty? || params[:type].empty? || params[:genre].empty?
          redirect to '/animelist/new'
        end 
          if logged_in?
            animelist = Animelist.create(params)
            animelist.user_id = current_user.id
            animelist.save
            redirect "/animelist/#{animelist.id}"
        end
    end
    
    
      get "/animelist/:id" do
        if @animelist = Animelist.find_by(:id => params[:id])
            erb :"/animelist/show"
        else  
          redirect to '/'
        end
        
    end
    
    
    get "/animelist/:id/edit" do
        if logged_in?
            @animelist = Animelist.find_by(:id => params[:id])
            erb :"/animelist/edit"
        else
            redirect to '/'
        end
    end
    
    
    patch "/animelist/:id" do
        @animelist = Animelist.find(params[:id])
        if logged_in? && @animelist.user_id == current_user.id 
           @animelist.update(params[:anime])
           redirect "/animelist/#{@animelist.id}"
          else
          redirect "/animelist/new"
        end
    end
    
      
    delete "/animelist/:id" do
        if logged_in?
          @animelist = Animelist.find_by(:id => params[:id]) 
          if @animelist.user == current_user
          @animelist.destroy
        redirect to "/users/#{current_user.id}"
        end
        else
          redirect to '/'
        end
      end
    end
end