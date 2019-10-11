class ReviewsController < ApplicationController 
  before_action :only_product_user, only: %i(new)
  before_action :alreadey_wirited, only: %i(new)
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    @image = @review.images.build
  end

  def create 
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.new(review_params)
    @review.product_id = @product.id
    if @review.save 
       redirect_to @review, notice: "投稿しました" 
    else 
      render "reviews/new"
    end
  end

  def destroy
  end

  def edit
  end

  def show
    @review = Review.find(params[:id])
  end

  def update
  end

  def index 
    @reviews = Review.all.order(created_at: :desc)
  end

  private 
  
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params 
    params.require(:review).permit(:title, :content,:rating, images_attributes: [:id,:image,:review_id,:_destroy])
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
