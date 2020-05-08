class UserController < ApplicationController

  get '/signup' do 
    if session[:user_id]
      redirect "/index"
    else
      erb :signup
    end
  end
  
  post '/signup' do
    if params[:password] != "" && params[:username] != ""
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/index"
    else
      redirect "/signup"
    end
  end
  
  get '/login' do
    if session[:user_id]
      redirect "/index"
    else
      erb :login
    end
  end
  
  post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/index"
    else
      redirect "/login"
    end
  end
  
  get '/logout' do 
    if session[:user_id]
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end
  post '/logout' do
    session.clear
    redirect "/login"
  end
   
  get '/user/characters' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      @characters = @user.characters
      erb :index
    else
      redirect "/login"
    end
  end
  
  
end