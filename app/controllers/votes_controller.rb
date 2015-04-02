class VotesController < ApplicationController


  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.new(upvote: params[:upvote])
    @vote.user = current_user
    binding.pry
  end

  # private

  # def vote_params
  #   params.require(:vote).permit(:upvote)
  # end

end
