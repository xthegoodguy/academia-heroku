class Api::V1::SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = ' Successfully logged in!'
      p "THIS WORKED"
      redirect_to '/api/v1/'
    else 
      p "THIS DIDN'T WORK"
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/api/v1/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/api/v1/login'
  end
end
