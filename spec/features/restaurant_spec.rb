require 'rails_helper'

feature "navigates to index page", %Q{
  As an authenticated user
  I want to view a list of restaurants
  So that I can pick items to review
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  scenario "user views index page" do
    visit restaurants_path

    expect(page).to have_content(restaurant.name)
  end

  scenario "user creates new restaurant" do
    visit restaurants_path
    click_on "New restaurant"

    expect(page).to have_content("Name")
    expect(page).to have_content("Street address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip code")
    expect(page).to have_content("Description")
    expect(page).to have_content("Phone")
  end

  scenario "user provides valid information" do
    visit new_restaurant_path
    fill_in("Name", with: restaurant.name)
    fill_in("Street address", with: restaurant.street_address)
    fill_in("City", with: restaurant.city)
    select("Massachusetts", from: "State")
    fill_in("Zip code", with: restaurant.zip_code)
    fill_in("Description", with: restaurant.description)
    click_on("Create Restaurant")

    expect(page).to have_content("Restaurant created!")
  end

  scenario "user proivdes invalid information" do
    visit new_restaurant_path
    click_on("Create Restaurant")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("Zip code can't be blank")
  end

  scenario "user clicks restaurant link" do
    visit restaurants_path

    click_link restaurant.name
    expect(page).to have_content("Description:")
    expect(page).to have_content(restaurant.description)
    expect(page).to have_content("Phone")
    expect(page).to have_content(restaurant.phone)
    expect(page).to have_content("Reservations")
    expect(page).to have_content(restaurant.reservations)
    expect(page).to have_content("Delivery")
    expect(page).to have_content(restaurant.delivery)
  end
end

feature "user edits a restaurant they own", %Q{
  As a restaurant owner
  I want to edit my restaurant
  So others can see correct details
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "owner edits a restaurant they own" do
    sign_in restaurant.user
    visit restaurant_path(restaurant)

    expect(page).to have_content("Edit restaurant")
  end

  scenario "owner provides new valid information" do
    sign_in restaurant.user
    visit edit_restaurant_path(restaurant)

    fill_in("Description", with: "New description goes here")
    click_button("Update Restaurant")
    expect(page).to have_content("Restaurant updated!")
  end

  scenario "owner provides new invalid information" do
    sign_in restaurant.user
    visit edit_restaurant_path(restaurant)

    fill_in("Name", with: "")
    click_button("Update Restaurant")
    expect(page).to have_content("Name can't be blank")
  end


  scenario "user attempts to update restaurant with invalid information" do
    sign_in restaurant.user
    visit edit_restaurant_path(restaurant)

    fill_in("Name", with: "")
    click_button("Update Restaurant")
    expect(page).to have_content("Name can't be blank")
  end

  scenario "user tries to update a restaurant they don't own" do
    sign_in user
    visit restaurant_path(restaurant)

    expect(page).not_to have_content("Edit restaurant")
  end
end

feature "user deletes a restaurant they own", %Q{
  As a restaurant owner
  I want to delete my restaurant
  Because it no longer exists
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }

  scenario "owner visits their own restaurant's details page" do
    sign_in restaurant.user
    visit restaurant_path(restaurant)

    expect(page).to have_content("Delete restaurant")
  end

  scenario "owner deletes their own restaurant" do
    sign_in restaurant.user
    visit restaurant_path(restaurant)
    click_link("Delete restaurant")

    expect(page).to have_content("Restaurant deleted!")
  end

end
