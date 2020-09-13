# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :forbid_not_mypage_user, only: %i[show]
  before_action :only_not_google_user, only: %i[edit]

  def show
    @monthly_money = EstimateAmount.target_amount @user
    @records = @user.records.includes(:label).order(purchase_date: :desc)[0..2]
    @count = @user.records.count_monthly

    respond_to do |format|
      format.html
      format.csv { send_data @user.records.generate_csv, filename: "records-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: 'またのご利用をお待ちしております'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def forbid_not_mypage_user
    redirect_to current_user, notice: '権限がありません' unless current_user.id == @user.id
  end

  def only_not_google_user
    redirect_to current_user, notice: 'アクセスできません' if !!current_user.provider
  end
end
