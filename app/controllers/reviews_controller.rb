class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to school_path(@review.school_id)
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to school_path(@review.school_id)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :school_id, :body)
  end
end
