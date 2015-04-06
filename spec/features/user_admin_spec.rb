require "rails_helper"

feature "admin can modify and delete users", %Q{
  As an admin
  I want to update or delete user accounts
  So that I can manage the website
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: "admin") }

  scenario "admin views list of users" do
    sign_in admin
    visit users_path
    expect(page).to have_content(user.email)
  end

  scenario "user attempts to view list of users" do
    sign_in user
    visit users_path
    expect(page).to have_content("Not Found")
  end

  scenario "admin deletes user" do
    sign_in admin
    visit users_path
    click_on("Delete", match: :first)
    expect(page).to have_content("User deleted!")
  end

  scenario "admin edits user" do
    sign_in admin
    visit users_path
    click_on("Edit", match: :first)
    expect(page).to have_button("Update User")
  end
end
