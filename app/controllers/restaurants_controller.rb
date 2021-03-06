class RestaurantsController < ApplicationController
  before_action :authorize_user, except: [:index, :show, :create, :new]

  def index
    @google_maps_url = 'https://www.google.com/maps/embed/v1/place?key=' + ENV["GOOGLE_MAPS_API_KEY"] + '&q=Chinatown+Boston+MA'
    if params[:search_text].present?
      @restaurants =
        Restaurant.search(params[:search_text]).order("name ASC")
        .page(params[:page])
    else
      @restaurants = Restaurant.order("name ASC").page(params[:page])
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @google_maps_url = %Q{
      https://www.google.com/maps/embed/v1/place?key=
      #{ENV["GOOGLE_MAPS_API_KEY"]}&q=#{@restaurant.parse_for_google_maps}
    }
    @reviews = @restaurant.reviews.page(params[:page])
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Restaurant created!"
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant updated!"
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant deleted!"
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name, :street_address, :city, :state, :zip_code, :description,
      :phone, :reservations, :delivery, :category_id, :user_id, :photo
      )
  end

  def authorize_user
    @restaurant = Restaurant.find(params[:id])
    user_signed_in? && @restaurant.editable_by?(current_user)
  end
end
