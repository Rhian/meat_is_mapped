# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

google.maps.event.addListener(Gmaps4Rails.map.map, 'click', function(object){ 
  alert(object.latLng);
});
