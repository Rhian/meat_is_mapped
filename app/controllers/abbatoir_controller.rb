class AbbatoirController < ApplicationController
  def map
    @json = Abbatoir.all.to_gmaps4rails
  end
end
