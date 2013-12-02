require 'spec_helper'

feature 'Friends Index' do
  self.use_transactional_fixtures = false
  
  before { 10.times { FactoryGirl.create(:friend) } }
 
  
  scenario 'should not have js errors', js: true do
    visit root_path
    expect(page).not_to have_errors
  end
  
  scenario "lets users delete friends", :js => true do
     10.times { FactoryGirl.create(:friend) }
     visit friends_path
     expect(page).to have_content("Person1")
     page.find("section", text: "Person1").find(".delete_friend").click
     page.evaluate_script('window.confirm = function() { return true; }')
     expect(page).to_not have_content("Person1")
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