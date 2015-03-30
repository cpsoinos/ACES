require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to create a review
  so that people can view my recommendation
} do
  scenario 'user successfully creates new review' do
   user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_review_path

    fill_in 'Body', with: 'very good restaurant'
    page.check("Five_stars")

    visit
    expect(page).to have_content('very good restaurant')
    expect(page).to have_content('Sign Out')
  end
end
