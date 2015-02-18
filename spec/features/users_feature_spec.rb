require 'rails_helper'

describe "The sign up process" do
  
  it "Creates new user" do
    visit "/users/new"
    fill_in "Userid", with: "user@domain.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content "Signed up"
    expect(page).to have_content "user@domain.com"
    expect(page).to have_link "Log out"
    #save_and_open_page
  end

  it "Doesn't create user when userid is missing" do
    visit "/users/new"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content "Userid can't be blank"
  end

  it "Doesn't create user when password is missing" do
    visit "/users/new"
    fill_in "Userid", with: "user@domain.com"
    click_button "Create User"

    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Password confirmation can't be blank"
  end

  it "Doesn't create user when password is small" do
    visit "/users/new"
    fill_in "Userid", with: "user@domain.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_button "Create User"
    expect(page).to have_content "Password is too short"
  end

  it "Doesn't create user when password mismatch" do
    visit "/users/new"
    fill_in "Userid", with: "user@domain.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content "Password confirmation doesn't match"
  end
end