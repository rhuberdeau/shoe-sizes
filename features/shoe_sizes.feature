Feature: The shoe sizes application should load properly

Background:
  Given I have some friends with shoes sizes

@javascript
Scenario: I visit the landing page
  Given I visit the landing page
	Then I should see a list of my friends
	And I should see their shoe sizes