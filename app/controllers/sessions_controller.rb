class SessionsController < ApplicationController

  def new
    @user=User.new
    @users = User.all
  end

  def create
  
  end

 def destroy
       session[:user_id].delete
       redirect_to root_url
  end

end
