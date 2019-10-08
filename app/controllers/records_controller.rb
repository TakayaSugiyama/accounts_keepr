class RecordsController < ApplicationController
  before_action :set_record, only: %i(show)
  def show;end

  def create
    @record = current_user.records.build(transaction_params)
    if @record.save  
      redirect_to @record, notice: "家計簿を作成しました"
    else 
      render "records/new"
    end
  end

  def destroy
  end

  def edit 
  end

  def new
    @record = current_user.records.build
    @memo = @record.memos.build
    @product = @record.products.build 
  end

  def update
  end

  private 

  def transaction_params 
    params.require(:record).permit(:store_name, :purchase_price, :purchase_date, 
                                    memos_attributes: [:id, :content, :user_id,:memo_id, :_destroy],
                                    products_attributes: [:id,:name,:price,:user_id,:record_id,:_destroy])
  end

  def set_record 
    @record = Record.find(params[:id])
  end

end
