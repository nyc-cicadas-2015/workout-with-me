class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :find_next_match

  def current_user
  	if session[:user_id]
  		return User.find_by(id: session[:user_id])
  	else
  		return nil
  	end
  end

  def logged_in?
  	session[:user_id]
  end

  def find_next_match(current_user, potential_matches)
  end
end
