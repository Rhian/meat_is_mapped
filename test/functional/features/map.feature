Feature: View Google Map
  In order to view the markers
  The user should see a map centred on the UK

Scenario: Google Map is present
Given I navigate to server
When I am on the home page
Then I should see a map


Scenario: Google Map can be expanded
Given I navigate to home page
When I click on the + button
Then I should see the map at 1/10,000