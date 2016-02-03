class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(params[:email, params[:email])
    if user &. user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_url, notice: "Thanks for logged in"
    else
      render :new
    end
end

def destroy
  session[:user_id] = nil
  redirect_to restaurants_url, notice: "Logout Successful"
end
end