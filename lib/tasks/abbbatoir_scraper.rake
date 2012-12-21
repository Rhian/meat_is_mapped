desc "Fetch abbatoirs"
task :get_abbatoirs

require 'nokogiri'
require 'rest_client'

for pgnum in 2..25 do
  @page = Nokogiri::HTML(RestClient.get("www.yell.com/ucs/UcsSearchAction.do?keywords=abattoirs&location=uk&pageNum=#{pgnum}"))
  names = @page.xpath('//html/body/div[3]/div/div/div/div/div/h2').text
  addresses = @page.css(".street-address").text
  postcodes = @page.css(".postal-code").text
  output = names + addresses.gsub(/<\/?[^>]*>/, "") + postcodes

  puts output

end