class RecordsController < ApplicationController
  before_action :set_record, only: %i(show edit destroy update)
  def show;end

  def create
    @record = current_user.records.build(record_params)
    if @record.save  
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

end
