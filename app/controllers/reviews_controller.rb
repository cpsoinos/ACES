class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:create, :new]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      UserMailer.review_alert_email(@restaurant.user).deliver_later
      flash[:notice] = "Review Created!"
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])

    if @review.user_id == current_user.id
      @review.destroy
      flash[:notice] = "Review Deleted!"
      redirect_to restaurant_path(@restaurant)
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant

    if @review.update(review_params)
      flash[:notice] = "Review updated!"
      redirect_to @restaurant
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :photo)
  end

  def authorize_user
    @review = Review.find(params[:id])
    user_signed_in? && @review.editable_by?(current_user)
  end
end
