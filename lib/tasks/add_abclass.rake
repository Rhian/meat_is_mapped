desc "create Abbatoir table"

task :add_abclass do

  DataMapper.setup(:default, 'sqlite3:db/animal_data.sqlite3.db')

    class Abbatoir

    include DataMapper::Resource
    property :id, Serial, :key => true
    property :name, String
    property :address, String
    property :postcode, String
  end

    DataMapper.finalize.auto_migrate!

end


