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
    if @character.save
      redirect "/sheet/#{@character.id}"
    else
      redirect "/new"
    end
  end
  
  get '/sheet/:id' do 
    if Character.find_by(id: params[:id]) && session[:user_id]
      @character = Character.find(params[:id])
      erb :show 
    else 
      redirect "/login"
    end
  end
  
  post '/sheet/:id/edit' do
    @character = Character.find(params[:id])
    erb :edit 
  end
  
  patch '/sheet/:id' do
    @character = Character.find(params[:id])
    if session[:user_id] == @character.user.id 
      params.delete("_method")
      @character.update(params)
    end
    redirect "/index"
  end
  
  delete '/sheet/:id/delete' do
    @character = Character.find(params[:id])
    if session[:user_id] == @character.user.id
      Character.destroy(params[:id])
    end
    redirect "/index"
  end
  
  
  
end