class Farm
  include DataMapper::Resource
  include DataMapper::GeoKit
  property :id, Serial, :key => true
  property :name, String
  property :address, String
  property :postcode, String  :validation => true
  property :latitude
  property :longitude
end