class Abbatoir < ActiveRecord::Base
	acts_as_gmappable :check_process => true

	 def gmaps4rails_address
    self.postcode
  end

  attr_accessible :address, :gmaps, :latitude, :longitude, :name, :postcode

  def gmaps4rails_infowindow
    html_window = "#{self.name}" + "<br>" + "#{self.address}" + "<br>" + "#{self.postcode}"
  end

end
