require "rails_helper"

feature "user creates review", %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  scenario "user successfully creates new review" do

    visit new_restaurant_review_path(restaurant)
    fill_in "Body", with: "very good restaurant"
    choose("5")
    click_button("Create Review")

    expect(page).to have_content("very good restaurant")
    expect(page).to have_content("Review Created!")
  end
end

feature "user deletes review", %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review) }

  before :each do
    sign_in user2
  end

  scenario "user successfully deletes review" do
    restaurant = FactoryGirl.create(:restaurant)
    visit new_restaurant_review_path(restaurant)
    fill_in "Body", with: "very good restaurant"
    choose("5")
    click_button("Create Review")
    click_link("Delete Review")

    expect(page).to have_content("Review Deleted!")
  end

  scenario "user cannot delete other user's review" do
    visit restaurant_path(review.restaurant)
    click_link("Delete Review")

    expect(page).to have_content("great place")
    expect(page).to have_content("You cannot delete another user's review!")
  end
end

feature "user edits review", %Q{
  As an authenticated user
  I want to edit a review I wrote
  so that I can change my mind
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario "user tries to edit a review he/she has written" do
    # restaurant = FactoryGirl.create(:restaurant)

    visit restaurant_path(review.restaurant)
    save_and_open_page
    binding.pry
    click_link("Edit Review")

    expect(page).to have_content("Body")
  end

  scenario "user tries to edit a review he/she has written" do
    restaurant = FactoryGirl.create(:restaurant)
    visit edit_restaurant_review_path(restaurant)
    fill_in "Body", with: "I changed my mind, and this place sucks"

    expect(page).to have_content("Review updated.")
  end


end
