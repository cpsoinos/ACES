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

  scenario "user successfully up-votes review" do
    visit restaurant_path(review.restaurant)
    click_button("upvote")

    expect(page).to have_content("Vote Received")
    expect(page).to have_content("Score: 1")
  end

  scenario "user successfully down-votes review" do
    visit restaurant_path(review.restaurant)
    click_button("downvote")

    expect(page).to have_content("Vote Received")
    expect(page).to have_content("Score: -1")
  end

  scenario "user cannot down-vote a review more than once" do
    visit restaurant_path(review.restaurant)
    click_button("downvote")
    click_button("downvote")

    expect(page).to have_content("You cannot vote twice on a single review")
    expect(page).to have_content("Score: -1")
  end

  scenario "user cannot up-vote a review more than once" do
    visit restaurant_path(review.restaurant)
    click_button("upvote")
    click_button("upvote")

    expect(page).to have_content("You cannot vote twice on a single review")
    expect(page).to have_content("Score: 1")
  end
end

feature "unauthenticated user can't vote on review", %Q{
  As an unauthenticated user
  I cannot vote a review
  because I am not signed in
} do
  let!(:review) { FactoryGirl.create(:review) }

  scenario "visitor can't vote on review" do
    visit restaurant_path(review.restaurant)

    expect(page).not_to have_button("Up-vote")
    expect(page).not_to have_button("Down-vote")
  end
end

feature "visitor cannot vote on a review", %Q{
  As a visitor
  I shouldn't be able to vote on a review
  Because I am not signed in
} do

  let!(:review) { FactoryGirl.create(:review) }

  scenario "visitor views a restaurant's reviews" do
    visit restaurant_path(review.restaurant)

    expect(page).to_not have_button("Up-vote")
    expect(page).to_not have_button("Down-vote")
  end
end
