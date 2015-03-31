class ReviewsController < ApplicationController
def new
  @restaurant= Restaurant.find(params[:restaurant_id])
  @review = Review.new

end
def create
    @restaurant= Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review Created!"
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])

    if @review.user_id != current_user.id
      flash[:notice] = "You cannot delete another user's review!"
      render 'restaurants/show'
    else
      @review.destroy
      flash[:notice] = "Review Deleted!"
      redirect_to restaurant_path(@restaurant)
    end
  end

private
  def review_params
    params.require(:review).permit(:rating, :body)
  end

end




