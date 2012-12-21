def get_abbatoirs
for pgnum in 2..25 do
  @page = Nokogiri::HTML(RestClient.get("www.yell.com/ucs/UcsSearchAction.do?keywords=abattoirs&location=uk&pageNum=#{pgnum}"))
  names = @page.xpath('//html/body/div[3]/div/div/div/div/div/h2').text
  addresses = @page.css(".street-address").text
  postcodes = @page.css(".postal-code").text
  output = names + addresses.gsub(/<\/?[^>]*>/, "") + postcodes

puts output

end
end


get_abbatoirs

=begin

adapter = DataMapper.repository(:default).adapter

parsed_results["aaData"].each_with_index do |entry, i|
  @output = entry[1].gsub(/<\/?[^>]*>/, "")
  @output2 = entry[5]
  adapter.execute('INSERT into Sales (booktitles,booksales) VALUES (?,?)', @output, @output2)
end

DataMapper.auto_upgrade!
=end