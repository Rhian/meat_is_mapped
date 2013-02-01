Feature: Markers are displayed on map
  In order to view the infowindows
  The user should see a map centred on the UK that can be zoomed to reveal markers

Scenario: Google Map is present
Given I navigate to server
When I am on the home page
Then I should see a map

Scenario: Marker can be clicked to open infowindow
Given I navigate to home page
When I click to expand the map
And I click on a marker
Then I should see an infobox containing text