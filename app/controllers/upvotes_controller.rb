class UpvotesController < ApplicationController
  def create
    if current_user
      @review = Review.find(params[:review_id])
      @vote = @review.votes.find_or_create_by(user: current_user)
      if @vote.increment
        flash[:notice] = "Vote Received"
      else
        flash[:notice] = "You cannot vote twice on a single review"
      end
      redirect_to restaurant_path(@review.restaurant)
    else
      redirect_to new_user_session_path
    end
  end
end
