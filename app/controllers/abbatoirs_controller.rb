class AbbatoirsController < ApplicationController
  def map
    @json = Abbatoir.all.to_gmaps4rails
  end
  def gmaps4rails_infowindow
    "#{self.name}, #{self.address}"
  end

end

