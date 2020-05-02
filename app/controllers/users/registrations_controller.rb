# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :prohibit_google_user, only: %i[edit update]

  protect_from_forgery prepend: true

  private

  def prohibit_google_user
    if !!current_user.provider
      redirect_to user_path(current_user), notice: 'アクセスできません'
    end
  end

  def after_sign_up_path_for(resource)
     current_user
  end

end
