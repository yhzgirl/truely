class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorized
    redirect_to root_path, :alert => "You need to be signed in to add a question" unless current_user
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
    helper_method :current_user

end
