require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "review a product" do
    sign_in user
    visit new_restaurant_review_path(restaurant)

    fill_in "Body", with: "Total garbage."
    choose 5
    click_button "Create Review"

    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
