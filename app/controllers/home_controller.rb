class HomeController < ApplicationController
  before_action :return_my_page

  def index;end
  
  private
  
  #ログインしているときは、マイページへ飛ぶ
  def return_my_page
    if user_signed_in? 
      redirect_to user_path(current_user.id)
    end
  end

end
