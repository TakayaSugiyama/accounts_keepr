# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_review
  def create
    favorite = Favorite.new(review_id: @review.id, user_id: current_user.id)
    favorite.save
    respond_to do |format|
      format.js { render :create }
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    respond_to do |format|
      favorite.destroy
      format.js { render :destroy }
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
