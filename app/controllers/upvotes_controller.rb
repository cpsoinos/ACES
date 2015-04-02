class UpvotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.find_or_create_by(user: current_user)

    flash[:notice] = @vote.increment
    redirect_to restaurant_path(@review.restaurant)
  end

end
