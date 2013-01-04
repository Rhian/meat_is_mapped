desc "create Abbatoir table"

task :add_abclass do

  DataMapper.setup(:default, 'sqlite3:db/animal_data.sqlite3.db')

  class Abbatoir
    include DataMapper::Resource
    include DataMapper::GeoKit
    property :id, Serial, :key => true
    property :name, String
    property :address, String
    property :postcode, String
    property :longitude, Float
    property :latitude, Float
    has_geographic_location :address
  end

    DataMapper.finalize.auto_migrate!

end


