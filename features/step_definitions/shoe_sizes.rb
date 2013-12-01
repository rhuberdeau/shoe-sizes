Given(/^I have some friends with shoes sizes$/) do
  10.times { FactoryGirl.create(:friend) }
end

Given(/^I visit the landing page$/) do
  visit root_path
end

Then(/^I should see a list of my friends$/) do
  expect(page).to have_content("Person 10")
end

Then(/^I should see their shoe sizes$/) do
  expect(page).to have_content("Shoe Size 10")
end