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

end
