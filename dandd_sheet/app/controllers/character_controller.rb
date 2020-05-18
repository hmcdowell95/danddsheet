class CharacterController < ApplicationController
  
  
  get "/index" do 
      logged_in?
      @characters = Character.all
      erb :index
  end
  
  get "/new" do 
    logged_in?
    erb :new
  end
   
  post '/new' do 
    @character = current_user.characters.new(params)
    if @character.save
      redirect "/sheet/#{@character.id}"
    else
      redirect "/new"
    end
  end
  
  get '/sheet/:id' do 
    logged_in?
    set_character
    erb :show 
  end
  
  post '/sheet/:id/edit' do
    set_character
    erb :edit 
  end
  
  patch '/sheet/:id' do
    set_character
    if current_user.id == @character.user.id 
      params.delete("_method")
      @character.update(params)
    end
    redirect "/index"
  end
  
  delete '/sheet/:id/delete' do
    set_character
    if current_user.id == @character.user.id
      Character.destroy(params[:id])
    end
    redirect "/index"
  end
  
  private
  
  def set_character
    @character = Character.find(params[:id])
  end
  
end