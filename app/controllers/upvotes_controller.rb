class UpvotesController < ApplicationController

  def create
    if current_user
      @review = Review.find(params[:review_id])
      @vote = @review.votes.find_or_create_by(user: current_user)
      flash[:notice] = @vote.increment
      redirect_to restaurant_path(@review.restaurant)
    else
      redirect_to new_user_session_path
    end
  end

end
