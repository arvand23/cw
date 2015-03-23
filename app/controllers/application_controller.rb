class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	current_user.present?
  end

  #used as before filters in controller so it locks out entire controller so people cant access stuff
  def ensure_current_user
  	if !logged_in?
		flash[:error] = "You must be signed in"
		redirect_to root_path and return
	end
  end

  def ensure_expert
  	raise ActionController::RoutingError.new('Not Found') unless logged_in? && current_user.expert?
  end

  def ensure_admin
  	raise ActionController::RoutingError.new('Not Found') unless logged_in? && current_user.admin?
  end


  helper_method :current_user, :logged_in?
end