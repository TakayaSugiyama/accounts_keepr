class EstimateAmountsController < ApplicationController
  def create 
    user = User.find(params[:user_id])
    @estimate_amount = user.estimate_amounts.build(estimate_amount_params)
    @estimate_amount.save
    respond_to do |format|
      format.js {render :create}
    end
  end

  private 
  
  def estimate_amount_params 
    params.require(:estimate_amount).permit(:price,:month,:year)
  end
end
