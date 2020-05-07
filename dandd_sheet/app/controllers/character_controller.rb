class CharacterController < ApplicationController
  
  get "/index" do 
    if session[:user_id]
      @characters = Character.all
      erb :index
    else 
      redirect "/login"
    end
  end
  
  get "/new" do 
    
  end
  
end