require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "user signs up" do
    visit new_user_registration_path

    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password@123"
    fill_in "user_password_confirmation", with: "password@123"

    click_button "Sign up"

    expect(page).to have_content("SETUP KEYWORD")

  end
end

