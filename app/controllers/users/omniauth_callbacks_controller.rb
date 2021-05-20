# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :store_location
  protect_from_forgery prepend: true

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in user
      set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
      redirect_to user
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, notice: '登録できませんでした'
    end
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url].nil? ? current_user : session[:previous_url]
  end

  def failure
    redirect_to root_path
  end

  private

  def store_location
    if request.path !=  user_google_oauth2_omniauth_callback_path && request.path != root_path
      session[:previous_url] = request.path
    elsif session[:previous_url] == root_path
      session[:previous_url] = nil
    end
  end
end
