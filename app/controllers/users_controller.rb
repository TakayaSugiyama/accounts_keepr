# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :forbid_not_mypage_user, only: %i[show]
  before_action :only_not_google_user, only: %i[edit]

  def show
    @monthly_money = EstimateAmount.target_amount(@user)
    @records = Record.recent_records(@user)
    @count = Record.recods_count_monthly(@user)

    respond_to do |format|
      format.html
      format.csv { send_data @user.records.generate_csv, filename: "records-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました'
    else
      respond_to do |format|
        format.js { render :error }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'またのご利用をお待ちしております'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def forbid_not_mypage_user
    if current_user.id != @user.id
      redirect_to user_path(current_user), notice: '権限がありません'
    end
  end

  def only_not_google_user
    if current_user.provider
      redirect_to user_path(current_user), notice: 'アクセスできません'
    end
  end
end
