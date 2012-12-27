class Abbatoir
  include DataMapper::Resource
  include DataMapper::GeoKit
  property :id, Serial, :key => true
  property :name, String
  property :address, String
  property :postcode, String
end
