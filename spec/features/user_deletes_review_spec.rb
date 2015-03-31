require 'rails_helper'

feature 'user deletes review', %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in user
  end


  scenario 'user successfully deletes review' do

    visit new_restaurant_review_path(restaurant)

    fill_in 'Body', with: 'very good restaurant'
    choose('5')
    click_button('Create Review')
    click_link('Delete Review')
    expect(page).to have_content('Review Deleted!')

  end
end
