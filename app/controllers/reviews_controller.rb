class ReviewsController < ApplicationController 
  before_action :set_review, only: %i(show destroy edit update)
  before_action :only_product_user, only: %i(new)
  before_action :alreadey_wirited, only: %i(new)

  PER = 8

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    3.times {@image = @review.images.build}
    #binding.pry
  end

  def create 
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.build(review_params)
    @review.product_id = @product.id 
    @review.images.each {|image| image.product_id = @product.id }
    if @review.save 
       redirect_to @review, notice: "投稿しました" 
    else 
      render "reviews/new"
    end
  end

  def destroy
    @review.destroy 
    redirect_to user_path(@review.user), notice: "削除しました"
  end

  def edit 
    gon.images = []
    @review.images.map do |image| 
      gon.images.push(image.image.url)
    end
  
    if gon.images.length <= 3 
      count = 3 - gon.images.length 
      count.times {@review.images.build}
    end
  end

  def show 
    gon.rating = {"#{@review.id}": @review.rating}
    @comments = @review.comments 
  end

  def update
    if @review.update(review_params) 
      redirect_to @review, notice: "レビューを更新しました"
    end
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
    params.require(:review).permit(:title, :content,:rating, images_attributes: [:id,:image,:_destroy])
  end

  def alreadey_wirited 
    @product = Product.find(params[:product_id]) 
    if @product.review
      redirect_to @product.review.user, notice: "既にレビューを書いています"
    end
  end

  def only_product_user 
    @product = Product.find(params[:product_id])  
    unless  @product.record.user == current_user 
      redirect_to @product.record.user, notice: "権限がありません"
    end
  end

end
