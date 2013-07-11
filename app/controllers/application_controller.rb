class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource
  before_filter :authenticate_user!


  def layout_by_resource
    return 'devise' if devise_controller?
    "application"
  end


  helper_method :url_for
  def default_url_options
    if current_user
      {username: current_user.username}
    else
      {}
    end
  end


end



