require "rails_helper"
require 'pry'

RSpec.describe RestaurantsController, type: :controller do

  describe 'GET #index' do
    it 'populates an array of restaurants' do
      restaurant = FactoryGirl.create(:restaurant)
      get :index
      assigns(:restaurants).should eq([restaurant])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
 end

describe 'GET #show' do
    it 'assigns the requested restaurant to @restaurant' do
      restaurant = FactoryGirl.create(:restaurant)
      get :show, id: restaurant
      assigns(:restaurant).should eq(restaurant)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:restaurant)
      response.should render_template :show
    end
  end

end
