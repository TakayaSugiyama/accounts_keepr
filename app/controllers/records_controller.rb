class RecordsController < ApplicationController
  def show
  end

  def create
    @record = current_user.records.build(transaction_params)
    binding.pry
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
    @record = Record.new 
    @memo = @record.memos.build
  end

  def update
  end

  private 

  def transaction_params 
    params.require(:record).permit(:store_name, :purchase_price, :purchase_date, 
                                        memos_attributes: [:id, :content, :user_id,:memo_id, :_destroy])
  end
end
