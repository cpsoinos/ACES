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

  scenario "user sees avatar in menu bar" do
    user = FactoryGirl.create(:user_with_photo)
    sign_in user
    visit root_path

    expect(page).to have_xpath("//img[@src=\"#{user.avatar.small_thumb.url}\"]")
  end

  scenario "user without avatar adds or updates an avatar photo" do
    user = FactoryGirl.create(:user)
    sign_in user
    visit edit_user_registration_path(user)
    attach_file("user_avatar", "#{Rails.root}/spec/fixtures/images/dan.jpg")

    click_button("Update")
    expect(page).to have_xpath("//img[@src=\"#{user.avatar.small_thumb.url}\"]")
  end
end
