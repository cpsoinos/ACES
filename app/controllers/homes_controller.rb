class HomesController < ApplicationController
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
end
