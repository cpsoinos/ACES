class DownvotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.find_or_create_by(user: current_user)

    flash[:notice] = @vote.decrement
    redirect_to restaurant_path(@review.restaurant)
  end

end
