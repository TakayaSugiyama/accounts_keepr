# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :return_my_page

  def index; end

  private

  # ログインしているときは、マイページへ飛ぶ
  def return_my_page
    redirect_to user_path(current_user.id) if user_signed_in?
  end
end
