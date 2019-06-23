class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
  #  redirect_to(controller: 'users', action: 'new') if !params[:name] || params[:name].empty?
    @user = User.create(:name => params[:user][:name],:height => params[:user][:height], :happiness => params[:user][:happiness],:nausea => params[:user][:nausea],:tickets => params[:user][:tickets],:password => params[:user][:password])
    session[:user_id] = @user.id

  #byebug
    redirect_to("/users/#{@user.id}")
    # this is the better/rails way redirect_to user_path(@user)
    #user_path(@user) = "/users/#{@user.id}" = "/users/4" ---> these are all equal
  end

  def show
    @user = User.find_by(params[:id])
    #string is passed in this method
  end

  def destroy
    user.delete :name
    redirect_to controller: 'application', action:'hello'
  end

<<<<<<< HEAD
=======
  def show

  end


>>>>>>> cf1b99947bef2cdcdb3469e3be5f5588593923df
end
