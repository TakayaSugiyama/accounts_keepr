# frozen_string_literal: true

module HomeHelper
  def header_menu_path
    if user_signed_in?
      'shared/layouts/login_user'
    else
      'shared/layouts/not_login_user'
    end
  end
end
