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
    if session[:user_id]
      erb :new
    else 
      redirect "/login"
    end
  end
   
  post '/new' do 
    @character = Character.new(params)
    @character.user = User.find(session[:user_id])
    @character.save
    redirect "/sheet/#{@character.id}"
  end
  
  get '/sheet/:id' do 
    if session[:user_id]
      @character = Character.find(params[:id])
      erb :show 
    else 
      redirect "/login"
    end
  end
  
  post '/sheet/:id/edit'
    @character = Character.find(params[:id])
    erb :edit 
  end
  
  post '/sheet/:id/delete'
    Character.destroy(params[:id])
    redirect "/index"
  end
  
  
end