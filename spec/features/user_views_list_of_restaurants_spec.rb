require 'rails_helper'

feature 'navigates to index page', %Q{
  As an authenticated user
  I want to view a list of restaurants
  So that I can pick items to review
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  scenario 'view index page' do
    visit restaurants_path

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content("Show")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end


  scenario 'user clicks restaurant show link' do
    visit restaurants_path

    click_link 'Show'
    expect(page).to have_content('Description:')
    expect(page).to have_content(restaurant.description)
    expect(page).to have_content('Phone')
    expect(page).to have_content(restaurant.phone)
    expect(page).to have_content('Reservations')
    expect(page).to have_content(restaurant.reservations)
    expect(page).to have_content('Delivery')
    expect(page).to have_content(restaurant.delivery)
  end
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
