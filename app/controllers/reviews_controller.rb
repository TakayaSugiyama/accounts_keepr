class ReviewsController < ApplicationController 
  before_action :set_review, only: %i(show destroy)
  before_action :only_product_user, only: %i(new)
  before_action :alreadey_wirited, only: %i(new)

  PER = 8

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    3.times {@image = @review.images.build}
    binding.pry
  end

  def create 
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.build(review_params)
    @review.product_id = @product.id 
    @review.images.each {|image| image.product_id = @product.id }
    if @review.save 
      #binding.pry
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
  end

  def show 
    gon.rating = {"#{@review.id}": @review.rating}
    @comments = @review.comments 
  end

  def update
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
