# frozen_string_literal: true

class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: %i[show edit destroy update]
  before_action :set_field, only: %i[edit]

  def show; end

  def create
    @record = current_user.records.build(record_params)
    @estimate_amount = EstimateAmount.get_monthly_goal(current_user)
    if @record.save
      current_user.alert_or_byond_mail_to_target_user(@estimate_amount)
      redirect_to @record, notice: '家計簿を作成しました'
    else
      render :new
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path(@record.user), notice: '家計簿を削除しました'
  end

  def edit; end

  def new
    @record = current_user.records.build
    @memo = @record.memos.build
    @product = @record.products.build
  end

  def update
    if @record.update(record_params)
      redirect_to @record, notice: '家計簿を更新しました'
    else
      render :edit
    end
  end

  def index
    gon.records = current_user.records_for_calendar(params[:label_id])
  end

  private

  def record_params
    params.require(:record).permit(:store_name, :purchase_price, :purchase_date, :label_id,
                                   memos_attributes: %i[id content user_id memo_id _destroy],
                                   products_attributes: %i[id name price user_id record_id _destroy])
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def set_field
    @product = @record.products.build if @record.products.empty?
    @memo = @record.memos.build if @record.memos.empty?
  end
end
