class ApplicationController < ActionController::Base
  layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	
  def login_required
    	if session[:user_id]
      		return true
	end
	flash[:warning]='Please login to continue'
	redirect_to :controller => "login", :action => "new"
	return false 
  end

  # private
	  def current_user 
		@_current_user ||= session[:user_id] && User.find(session[:user_id]) 
	  end
end
