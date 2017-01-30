# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
getLocation = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      console.log(position)
      $.ajax(
        type: 'GET'
        url: '/places/location'
        data:
          lat: position.coords.latitude
          lng: position.coords.longitude
        contentType: 'application/json'
        dataType: 'json').done (data) ->
        console.log data
        return
      return
  return

$ ->
    getLocation()
