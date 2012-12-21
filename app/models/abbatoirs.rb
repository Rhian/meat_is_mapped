DataMapper.setup(:default, 'sqlite3:animal_data.db')

class Abbatoir
  include DataMapper::Resource
  property :id, Serial, :key => true
  property :name, String
  property :postcode, String
  property :latitude, Integer
  property :longitide, Integer
end

DataMapper.auto_migrate!