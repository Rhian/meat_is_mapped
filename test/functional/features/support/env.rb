require "watir-webdriver"

browser = Watir::Browser.new(:ff)

Before do
  @browser = browser
end

at_exit do
  browser.close
end
