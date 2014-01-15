require 'rest-client'
require 'sqlite3'
require 'active_record'
require 'nokogiri'

desc "scrape farm details"

# First scrape names, addresses and postcodes of UK livestock farms

task :scrape_farms do

  DBCONN = ActiveRecord::Base.establish_connection({:adapter => "sqlite3", :database => '/db/animal_data.sqlite3'})

  for pgnum in 1..1224 do
    @page = Nokogiri::HTML(RestClient.get("http://xxxxxxxxxxxxxxxxx/page/#{pgnum}"))
	@page.css("div.icListItem").each do |x|
    x.css("a.busNameLink").each do |names|
    @names = names.text
    end
    x.css("span >span:first-child").each do |streetaddresses|
	if streetaddresses.text != "View telephone number"
	@street_address = streetaddresses.text
	end
    end
    x.css("span >span:nth-child(2)").each do |addresses|
    @address = addresses.text.capitalize
	@full_address = @street_address + ", " + @address
    end
    x.css("span >span:last-child").each do |postcodes|
	if postcodes.text != "View telephone number"
	@postcodes = postcodes.text.split(//).last(8).join.to_s
	end
	end

    # update model with new data or give error message if not scraped

      if @postcodes != nil
        update = DBCONN.connection.raw_connection.prepare("INSERT INTO abbatoirs (name, address, postcode, type) VALUES(:name, :address, :postcode, :type)")
        update.execute(:name => @names, :address => @full_address, :postcode => @postcodes, :type => "Livestock farm")
        update.close
      else
        puts "No postcodes were scraped"
      end

    end
  end

end
