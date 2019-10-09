class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    @image = @review.images.build
  end

  def create 
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    if @review.save 
       redirct_to @review, notice: "投稿しました" 
    else 
      render "reviews/new"
    end
  end

  def destroy
  end

  def edit
  end

  def show
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
    params.require(:review).permit(:title, :content, images_attributes: [:id,:image,:product_id,:_destroy])
  end

end
