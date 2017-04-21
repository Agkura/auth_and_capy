require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'username', with: "test"
      fill_in 'password', with: "password"
      click_on "Sign Up"

      expect(page).to have_content("test")
    end
  end
end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    visit new_user_url
    fill_in 'username', with: "tests"
    fill_in 'password', with: "password"
    click_on "Sign Up"

    expect(page).to have_content("tests")
  end

end

feature "logging out" do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "tests"
    fill_in 'password', with: "password"
    click_on "Sign Up"
    click_on "Log Out"
  end

  scenario "begins with a logged out state" do
    visit users_url
    expect(page).to have_content("Log In")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit users_url
    expect(page).not_to have_content("test")
  end
end
