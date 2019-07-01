class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #def hello
  #  redirect_to controller: 'secrets', action: 'show' unless session[:name]
  #end

  #def current_user
  #  session[:name]
  #end

  #private

  #def require_logged_in
  #  redirect_to controller: 'users', action: 'new' unless current_user
  #end

  before_action :current_user
  before_action :require_logged_in, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  def admin_only
    if !current_user.admin
      redirect_to root_path, notice: "Not an admin"
    end
  end

private
  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    #helper_method :current_user
  end
