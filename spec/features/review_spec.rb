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
    # attach_file("review_photo", "spec/fixtures/dan.jpg")
    click_button("Create Review")

    expect(page).to have_content("very good restaurant")
    expect(page).to have_content("Review Created!")
  end

  scenario "user submits review without rating" do
    visit new_restaurant_review_path(restaurant)
    fill_in "Body", with: "something"
    click_button("Create Review")

    expect(page).to have_content("Rating can't be blank")
  end

  scenario "user submits review without body" do
    visit new_restaurant_review_path(restaurant)
    choose("5")
    click_button("Create Review")

    expect(page).to have_content("Body can't be blank")
  end
end

feature "user deletes review", %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario "user successfully deletes review" do
    sign_in review.user
    visit restaurant_path(review.restaurant)
    click_link("Delete Review")

    expect(page).to have_content("Review Deleted!")
  end

  scenario "user cannot delete other user's review" do
    sign_in user
    visit restaurant_path(review.restaurant)

    expect(page).to have_content(review.body)
    expect(page).not_to have_content("Delete Review")
  end
end

feature "guest can't write a review", %Q{
  As a guest
  I should not be able to review a restaurant
  Because I am not signed in
} do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }

  scenario "guest tries to review a restaurant" do
    visit restaurant_path(restaurant)

    expect(page).not_to have_content("Write Review")
  end
end

feature "user edits review", %Q{
  As an authenticated user
  I want to edit a review I wrote
  so that I can change my mind
} do

  let!(:review) { FactoryGirl.create(:review) }
  before :each do
    sign_in review.user
  end

  scenario "user tries to edit a review" do
    visit restaurant_path(review.restaurant)
    click_link("Edit Review")

    expect(page).to have_content("Edit your review of #{review.restaurant.name}")
  end

  scenario "user tries to edit a review he/she has written" do
    visit edit_restaurant_review_path(review.restaurant, review)
    fill_in "Body", with: "I changed my mind, and this place sucks"
    click_button("Update Review")

    expect(page).to have_content("Review updated!")
  end

  scenario "user submits edited review without body" do
    visit edit_restaurant_review_path(review.restaurant, review)
    fill_in "Body", with: ""
    click_button("Update Review")

    expect(page).to have_content("Body can't be blank")
  end

end


