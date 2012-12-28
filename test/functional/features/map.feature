Feature: View Google Map
  In order to view the markers
  The user should see a map centred on the UK

Scenario: Google Map is present
Given I navigate to server
When I am on the home page
Then I should see a map