require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "user signs up" do
    visit new_user_registration_path
  end
end

