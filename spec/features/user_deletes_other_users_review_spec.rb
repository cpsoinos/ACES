require 'rails_helper'

feature 'user deletes review', %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review)}

  before :each do
    sign_in user
  end


  scenario 'user cannot delete other users review' do

    visit restaurant_path(restaurant)
    click_link('Delete Review')

    expect(page).not_to have_content('very good restaurant')
    expect(page).not_to have_content('Review Deleted!')

  end
end
