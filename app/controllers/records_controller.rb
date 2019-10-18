class RecordsController < ApplicationController
  before_action :set_record, only: %i(show edit destroy update)
  before_action :set_date , only: %i(create)

  def show;end

  def create
    @record = current_user.records.build(record_params)
    @estimate_amount = EstimateAmount.find_by(user_id: current_user.id, year: @today.year, month: @today.month)
    if @record.save  
      @sum_price = current_user.records.where(purchase_date: @first_day..@last_day).map(&:purchase_price).sum
      percent = (@sum_price.to_f / @estimate_amount.price ) * 100  if @estimate_amount 
      if    percent >= 85  && @estimate_amount &&  percent < 100
        AlertMailer.alert_mail(current_user, @estimate_amount, @sum_price).deliver
      elsif percent >= 100 &&  @estimate_amount
        BeyondMailer.beyond_mail(current_user, @estimate_amount, @sum_price).deliver
      end
      redirect_to @record, notice: "家計簿を作成しました"
    else 
      render "records/new"
    end
  end

  def destroy 
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path(@record.user),notice: "家計簿を削除しました"
  end

  def edit
    @product = @record.products.build if @record.products.length == 0 
    @memo = @record.memos.build if @record.memos.length == 0
  end

  def new
    @record = current_user.records.build
    @memo = @record.memos.build
    @product = @record.products.build 
  end

  def update
    if @record.update(record_params)
      redirect_to @record, notice: "家計簿を更新しました"
    end 
  end

  private 

  def record_params 
    params.require(:record).permit(:store_name, :purchase_price, :purchase_date,:label_id,
                                    memos_attributes: [:id, :content, :user_id,:memo_id, :_destroy],
                                    products_attributes: [:id,:name,:price,:user_id,:record_id,:_destroy])
  end

  def set_record 
    @record = Record.find(params[:id])
  end

  def set_date 
    @today = Date.today 
    @last_day = Date.new(@today.year, @today.month, -1).strftime("%Y-%m-%d")
    @first_day = Date.new(@today.year, @today.month).strftime("%Y-%m-%d")
  end

end
