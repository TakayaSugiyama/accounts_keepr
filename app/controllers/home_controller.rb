# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :return_my_page, only: %i[index]

  def index; end

  def service; end

  def privacy; end

  private

  # ログインしているときは、マイページへ飛ぶ
  def return_my_page
    redirect_to current_user, notice: '既にログインしています' if user_signed_in?
  end
end
