require 'rails_helper'

describe "Files dashboard" do
  before :each do
    FactoryGirl.create :bfile
    visit "/sessions/new"
    fill_in "Userid", with: "user@domain.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  it "shows uploaded files" do
    expect(page).to have_content "testupload.txt"
    expect(page).to have_link "Download"
    expect(page).to have_link "Delete"
  end

  it "deletes file successfully" do
    click_link "Delete"
    expect(page).to have_no_content "testupload.txt"
    expect(page).to have_content "File deleted"
    save_and_open_page
  end

end