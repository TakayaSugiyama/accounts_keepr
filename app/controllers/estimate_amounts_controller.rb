# frozen_string_literal: true

class EstimateAmountsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @estimate_amount = user.estimate_amounts.build(estimate_amount_params)
    respond_to do |format|
      if @estimate_amount.save
        format.js { render :create }
      else
        format.js { render :error }
      end
    end
  end

  private

  def estimate_amount_params
    params.require(:estimate_amount).permit(:price, :month, :year)
  end
end
