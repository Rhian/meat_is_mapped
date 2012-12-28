require "watir-webdriver"

Given /^I navigate to server$/ do
  @browser.goto "http://localhost:3000"
end

When /^I am on the home page$/ do
  @browser.title == "index"
  end

Then /^I should see a map$/ do
  @browser.div(:id => "map_canvas") == true
end
