class ReviewsController < ApplicationController
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
  end

  private 
  
  def set_product 
    @review = Review.find(params[:id])
  end

  def review_params 
    params.require(:review).permit(:title, :content,:rating, images_attributes: [:id,:image,:review_id,:_destroy])
  end

end
