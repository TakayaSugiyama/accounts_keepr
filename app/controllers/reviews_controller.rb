# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show destroy edit update]
  before_action :only_product_user, only: %i[new]
  before_action :alreadey_wirited, only: %i[new]
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  before_action :only_review_user, only: %i[edit update]

  PER = 8

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    3.times { @image = @review.images.build }
    # binding.pry
  end

  def create
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to @review, notice: '投稿しました'
    else
      render 'reviews/new'
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(@review.user), notice: '削除しました'
  end

  def edit
    gon.images = []
    @review.images.map do |image|
      gon.images.push(image.image.url)
    end
    gon.edit_rating = @review.rating
    if gon.images.length <= 3
      count = 3 - gon.images.length
      count.times { @review.images.build }
    end
  end

  def show
    gon.rating = { "#{@review.id}": @review.rating }
    @comments = @review.comments
  end

  def update
    redirect_to @review, notice: 'レビューを更新しました' if @review.update(review_params)
  end

  def index
    @reviews = Review.page(params[:page]).per(PER).order(created_at: :desc)
    gon.ratings = {}
    @reviews.each do |review|
      gon.ratings[review.id] = review.rating
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :product_id, images_attributes: %i[id image _destroy])
  end

  def alreadey_wirited
    @product = Product.find(params[:product_id])
    redirect_to @product.review.user, notice: '既にレビューを書いています' if @product.review
  end

  def only_product_user
    @product = Product.find(params[:product_id])
    unless @product.record.user == current_user
      redirect_to @product.record.user, notice: '権限がありません'
    end
  end

  def only_review_user
    unless @review.user == current_user
      redirect_to user_path(current_user), notice: '権限がありません'
    end
  end
end
