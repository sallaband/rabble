class Api::ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    if review.save
      render json: review
    else
      render json: review.errors.full_messages, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:author_id, :game_id, :rating, :review_body)
  end
end