class SessionsController < ApplicationController

  def new
    @user=User.new
     @users = User.all
  end

  def create
    #byebug
     @user = User.find_by(name: params[:user][:name])
     if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome"
      #user path returns a string based on the data entered
    else
      redirect_to signin_path
    end
  end

 def destroy
      session.delete(:user_id)
       redirect_to root_url
  end

end
