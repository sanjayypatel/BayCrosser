class ApplicationController < ActionController::Base
  require 'net/http'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ACTransitRails::APIAccessError do |exception|
    flash[:alert] = exception.message
    redirect_to(request.referrer || root_path)
  end
end
