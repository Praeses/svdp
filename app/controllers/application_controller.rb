class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  before_filter :authenticate_user!, :redirect_https


  def layout_by_resource
    return 'devise' if devise_controller?
    "application"
  end

  def redirect_https
    return true unless Rails.env.production?
    redirect_to :protocol => "https://" unless request.ssl?
    return true
  end


end
