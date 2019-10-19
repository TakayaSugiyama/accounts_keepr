# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: provider.to_s.capitalize)
      end
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, notice: '登録できませんでした'
    end
  end

  def failure
    redirect_to root_path
  end
end
