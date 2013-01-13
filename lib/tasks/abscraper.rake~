require 'rest-client'
require 'sqlite3'
require 'active_record'
require 'nokogiri'

desc "scrape abbatoir details"

# First scrape names, addresses and postcodes of UK slaughterhouses

task :scrape_abdata do

  DBCONN = ActiveRecord::Base.establish_connection({:adapter => "sqlite3", :database => '///home/user/RubyExamples/MeatMap/db/animal_data.sqlite3'})

  for pgnum in 2..17 do
    @page = Nokogiri::HTML(RestClient.get("http://uk.local.yahoo.com/United_Kingdom/England/slaughterhouse/search-24554868.html?fr=sfp&cb=1#{pgnum}1"))
    @page.css("div.addr, div.adr.h2").each do | div |
      div.css("a.fn").each do |names|
        @one = names.text
      end
      div.css(".street-address").each do |addresses|
        @two = addresses.text
      end
      div.css(".postal-code").each do |postcodes|
        @three = postcodes.text.split(//).last(8).join.to_s
      end

    # update model with new data or give error message if not scraped

      if @three != nil
        update = DBCONN.connection.raw_connection.prepare("INSERT INTO abbatoirs (name, address, postcode) VALUES(:name, :address, :postcode)")
        update.execute(:name => @one, :address => @two, :postcode => @three)
        update.close
      else
        puts "No postcodes were scraped"
      end

    end
  end

end
