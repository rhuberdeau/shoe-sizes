require 'spec_helper'

feature 'Friends Index' do
  
  # before { 10.times { FactoryGirl.create(:friend) } }
 
  
  scenario 'should not have js errors', js: true do
    visit root_path
    expect(page).not_to have_errors
  end
  
  scenario "lets users delete friends", :js => true do
     FactoryGirl.create(:friend, name: "Ted")
     visit friends_path
     expect(page).to have_content("Ted")
     page.find("section", text: "Ted").find(".delete_friend").click
     page.evaluate_script('window.confirm = function() { return true; }')
     expect(page).to_not have_content("Ted")
   end
  
  scenario "lets users create new friend entries", js: true do
    visit friends_path
    page.fill_in "friend_name", with: "Steve"
    page.fill_in "friend_age", with: "44"
    page.click_button "New Friend"
    sleep 2
    expect(page).to have_selector('section', text: 'Steve')
  end
end