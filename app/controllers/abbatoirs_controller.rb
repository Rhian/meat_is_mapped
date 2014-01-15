require 'gmaps4rails'

class AbbatoirsController < ApplicationController
   def map
      @abbatoirs = Abbatoir.all
      @json = @abbatoirs.to_gmaps4rails
   end
end


