class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  before_filter :authenticate_user!


  def layout_by_resource
    return 'devise' if devise_controller?
    "application"
  end


end
