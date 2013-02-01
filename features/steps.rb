require "watir-webdriver"

Given /^I navigate to server$/ do
  @browser.goto "http://localhost:3000"
end

When /^I am on the home page$/ do
  @browser.title == "index"
  end

Then /^I should see a map$/ do
  @browser.div(:id => "map") == true
end

Given /^I navigate to home page$/ do
  @browser.goto "http://localhost:3000"
end

When /^I click to expand the map$/ do 
  @browser.div(:class => "cluster", :index => 0).click
  @browser.wait
  @browser.div(:class => "cluster", :index => 1).click
  @browser.wait
end

When /^I click on a marker$/ do
  @browser.img.click
end

Then /^I should see an infobox containing text$/ do
  pending # express the regexp above with the code you wish you had
end

