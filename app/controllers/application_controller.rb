# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?
  before_action  :store_location

  include HomeHelper

  protected

  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # frendly following 
  def store_location
    if request.fullpath !=  new_user_session_path
      session[:previous_url] = request.fullpath 
    end
  end 

  def after_sign_in_path_for(resource)
    if !session[:previous_url].nil?
       session[:previous_url]
    else
       current_user
    end
  end

  def after_sign_out_path_for(resource)
      root_url 
  end
end
