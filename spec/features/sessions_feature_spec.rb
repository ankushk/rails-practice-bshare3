require 'rails_helper'

describe "The Log in process" do
  
  before :each do
    @user = FactoryGirl.create :user
  end

  it "Logs in correctly" do
    visit "/sessions/new"
    fill_in "Userid", with: @user.userid
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "Logged in"
    expect(page).to have_content "user@domain.com"
    expect(page).to have_link "Log out"
    #save_and_open_page
  end

  it "Fails to login with incorrect password" do
    visit "/sessions/new"
    fill_in "Userid", with: @user.userid
    fill_in "Password", with: "pass"
    click_button "Log in"

    expect(page).to have_content "Invalid"
    expect(page).to have_link "log in"
  end

  it "Logs out correctly" do
    visit "/sessions/new"
    fill_in "Userid", with: @user.userid
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_link "Log out"
    click_link "Log out"
    expect(page).to have_content "Logged out"
    expect(page).to have_link "log in"
  end

end