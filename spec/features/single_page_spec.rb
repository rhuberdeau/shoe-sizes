require 'spec_helper'

feature 'Friends Index' do
  # before { 10.times { FactoryGirl.create(:friend) } }
 
  
  scenario 'should not have js errors', js: true do
    visit root_path
    expect(page).not_to have_errors
  end
  
  context "when deleting a friend" do
    before { FactoryGirl.create(:friend, name: "Tod", age: "30")}
    
    scenario "lets users delete friends", :js => true do
       visit friends_path
       expect(page).to have_content("Tod")
       find("div", text: "Tod").find(".delete_friend").click
       evaluate_script('window.confirm = function() { return true; }')
       expect(page).to_not have_content("Tod")
       expect(page).to have_content("Friend was successfully deleted")
     end
  end
  
  context "creating a friend" do
    scenario "with valid friend and shoe size attributes", js: true do
      visit friends_path
      fill_in "friend_name", with: "Alan"
      fill_in "friend_age", with: "29"
      fill_in "friend[shoe_attributes][size]", with: "11"
      click_button "Save"
      expect(page).to have_selector('div', text: 'Alan')
      expect(page).to have_selector('div', text: '11')
      expect(page).to have_content("Friend was successfully created.")
    end
    
    scenario "with invalid friend attributes", js: true do
      visit friends_path
      fill_in "friend_age", with: "29"
      fill_in "friend[shoe_attributes][size]", with: "11"
      click_button "Save"
      expect(page).to have_content "Name can't be blank"
    end
    
    scenario "without a shoe size", js: true do
      visit friends_path
      fill_in "friend_name", with: "Alan"
      fill_in "friend_age", with: "29"
      click_button "Save"
      expect(page).to have_content "Shoe size can't be blank"
    end
  end
  
  context "editing a friend" do
    scenario "lets users edit friend entries", js: true do
      FactoryGirl.create(:friend, name: "Bill", age: "30")
      visit friends_path
      expect(page).to have_content("Bill")
      find("div", text: "Bill").find(".edit_friend").click
      fill_in "friend[age]", with: "50"
      click_button "Update Friend"
      sleep 1
      expect(page).to have_selector('div', text: '50')
      expect(page).to have_content("Friend was successfully updated.")
    end
  end
end