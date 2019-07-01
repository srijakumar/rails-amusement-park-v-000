class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update, :destroy]
#before_action :require_login, only: [:show]



  def new
    @user = User.new
  end


  def create
  #  redirect_to(controller: 'users', action: 'new') if !params[:name] || params[:name].empty?
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}") # notice: "User created."
  #byebug
    else
      render :new
    end
    # this is the better/rails way redirect_to user_path(@user)
    #user_path(@user) = "/users/#{@user.id}" = "/users/4" ---> these are all equal
  end

  def show
  #  byebug
    @user = User.find(params[:id])
    #string is passed in this method
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    admin_only
    user.delete :name
    redirect_to controller: 'application', action:'hello', notice: "User destroyed"
  end

private
  def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
