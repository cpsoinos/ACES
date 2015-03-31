
require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end


  scenario 'user successfully creates new review' do

    visit new_restaurant_review_path(restaurant)

    fill_in 'Body', with: 'very good restaurant'
    choose('5')
    click_button('Create Review')
    expect(page).to have_content('very good restaurant')
    expect(page).to have_content('Review Created!')

  end
end
