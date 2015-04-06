require "rails_helper"

feature "admin can modify and delete users", %Q{
  As an admin
  I want to update or delete user accounts
  So that I can manage the website
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: "admin") }

  scenario "admin sees link to admin section" do
    sign_in admin
    visit root_path

    expect(page).to have_link("Admin")
  end

  scenario "user should not see link to admin section" do
    sign_in user
    visit root_path

    expect(page).to_not have_link("Admin")
  end

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

  scenario "admin edits user email" do
    sign_in admin
    visit edit_user_path(user)
    fill_in "Email", with: "new_email@somewhere_else.com"
    click_button("Update User")

    expect(page).to have_content("User updated!")
  end

  scenario "admin edits role" do
    sign_in admin
    visit edit_user_path(user)
    select("admin", from: "user_role")
    click_button("Update User")

    expect(page).to have_content("User updated!")
  end

  scenario "admin doesn't provide an email" do
    sign_in admin
    visit edit_user_path(user)
    fill_in "Email", with: ""
    click_button("Update User")

    expect(page).to have_content("Email can't be blank")
  end
end
