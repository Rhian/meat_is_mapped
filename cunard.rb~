require 'rubygems'
require 'nokogiri'
require 'anemone'

Anemone.crawl("http://gb.newdev.qa.lbi.co.uk/") do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end
