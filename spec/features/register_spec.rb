require 'rails_helper'
require 'capybara/rails'

feature 'Register' do

  scenario 'Users cannot register with invalid info' do

    visit root_path
    click_on "Register"
    fill_in "Name", with: "Betty"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_button "Register"
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'Users can register with valid info' do

    visit root_path
    click_on "Register"
    fill_in "Name", with: "Betty"
    fill_in "Email", with: "betty@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_button "Register"
    expect(page).to have_no_content("Email can't be blank")
    expect(page).to have_content("Welcome betty@example.com!")
  end

end
