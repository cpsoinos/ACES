require "rails_helper"

feature "user votes on review", %Q{
  As an authenticated user
  I want to vote a review
  so that people can view my opinion of the review
} do

  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  scenario "user successfully up votes review" do
    visit restaurant_path(review.restaurant)
    click_button("Up-vote")

    expect(page).to have_content("Vote Recieved")
    expect(page).to have_content("Score: 1")
  end

  scenario "user successfully down votes review" do
    visit restaurant_path(review.restaurant)
    click_button("Down-vote")

    expect(page).to have_content("Vote Recieved")
    expect(page).to have_content("Score: -1")
  end

  scenario "user cannot vote more than once" do
    visit restaurant_path(review.restaurant)
    click_button("Down-vote")
    click_button("Down-vote")
    expect(page).to have_content("You cannot vote twice on a single review")
    expect(page).to have_content("Score: -1")
  end
end

feature "unauthenticated user can't vote on review", %Q{
  As an unauthenticated user
  I cannot vote a review
  because I am not signed in
} do

  let!(:review) { FactoryGirl.create(:review) }

  scenario "visitor tries to down vote on review redirects to signin" do
    visit restaurant_path(review.restaurant)
    click_button("Down-vote")
    expect(page).to have_content("Log in")
  end
end


