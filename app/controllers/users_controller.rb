class UsersController < ApplicationController

  def new
  end

  def create
    return redirect_to(controller: 'users', action: 'new') if !params[:name] || params[:name].empty?
    user[:name] = params[:name]
    redirect_to controller: 'application', action: 'hello'
  end

  def destroy
    user.delete :name
    redirect_to controller: 'application', action:'hello'
  end


end
