class Abbatoir < ActiveRecord::Base
  acts_as_gmappable

  def gmaps4rails_address
    self.postcode
  end
  attr_accessible :address, :gmaps, :latitude, :longitude, :name, :postcode
end
