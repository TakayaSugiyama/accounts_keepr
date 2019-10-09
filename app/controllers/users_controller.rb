class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :forbid_not_mypage_user, only: %i(show)
  def show
    labels = @user.records.map(&:labels).map(&:first).map(&:name)
    @chart = {}
    labels.uniq.each do |name|
      @chart["#{name}"] = labels.count(name)
    end
    today = Date.today
    @last_day = Date.new(today.year, today.month, -1).strftime("%Y-%m-%d")
    @first_day = Date.new(today.year, today.month).strftime("%Y-%m-%d")
    @sum = @user.records.where(purchase_date: @first_day..@last_day).map(&:purchase_price).sum
    @monthly_money  =  EstimateAmount.find_by(month: Date.today.month, year: Date.today.year, user: @user)
  end
  
  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def forbid_not_mypage_user 
    if  current_user.id != @user.id
      redirect_to  user_path(current_user), notice: "権限がありません"
    end
  end
end
