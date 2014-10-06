# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

lat = $('.lat').text()
long = $('.long').text()


map = new GMaps(
  div: '#map'
  lat: lat
  lng: long
)

map.addMarker(
  lat: lat
  lng: long
)