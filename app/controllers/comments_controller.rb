# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.build(comment_params)
    @comment.review_id = @review.id if @review
    respond_to do |format|
      if @review && @comment.save
        @comments = @review.comments
        format.js { render 'comments/create' }
      else
        format.js { render 'comments/error' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js { render 'comments/destroy' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :review_id, :user_id)
  end
end
