require "rails_helper"

feature "user registers", %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don"t specify the required information, I am presented with
  #   an error message

  scenario "provide valid registration information" do
    visit new_user_registration_path

    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    click_button "Sign up"
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "upload an avatar photo" do
    user = FactoryGirl.create(:user)
    sign_in user
    visit edit_user_registration_path(user)
    fill_in "Current password", with: "password"
    attach_file("user_avatar", "spec/fixtures/dan.jpg")

    expect(page).to have_image(user.avatar.url)
  end
end
