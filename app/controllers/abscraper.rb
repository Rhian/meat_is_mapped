require 'data_mapper'
require 'dm-geokit'
require 'dm-is-versioned'
require 'rest-client'
require 'sqlite3'
require 'dm-core'

adapter = DataMapper.setup(:default, 'sqlite3:db/animal_data.sqlite3.db')

begin
for pgnum in 2..17 do
  @page = Nokogiri::HTML(RestClient.get("http://uk.local.yahoo.com/United_Kingdom/England/slaughterhouse/search-24554868.html?fr=sfp&cb=1#{pgnum}1"))
    @page.css("div.addr, div.adr.h2").each do | div |
    div.css("a.fn").each do |names|
      @names = names.text
    end
    div.css(".street-address").each do |addresses|
      @addresses = addresses.text
    end
    div.css(".postal-code").each do |postcodes|
      @postcodes = postcodes.text.split(//).last(8).join.to_s
    end
    adapter.execute('INSERT into abbatoirs (name, address, postcode) VALUES (?,?,?)', @names, @addresses, @postcodes)
    end
	rescue
	puts "unable to reach external website"
	end
  end

