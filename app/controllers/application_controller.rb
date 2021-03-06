class ApplicationController < ActionController::Base
  protect_from_forgery

  # http://stackoverflow.com/questions/1168144/
  # having-to-call-render-layout-false-to-correctly-render-js-erb-template-in
  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }

  def authorized
    redirect_to root_path, :alert => "Please sign in to complete this request" unless current_user
  end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
    helper_method :current_user


end
