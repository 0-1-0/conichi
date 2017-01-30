class PlacesController < ApplicationController
def location
    respond_to do |format|
      format.json {
        lat = params["lat"].to_f
        lng = params["lng"].to_f
        # radius = 5000
        # type = "restraunt"
        # key = ""
        # url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{radius}&types=#{type}&key=#{key}"
        # data = JSON.load(open(url))
        @client = GooglePlaces::Client.new("AIzaSyBrl7pY8K15caxHLJ3D8_-uSiXXLuZos0c")
        data = @client.spots(lat, lng)
        render json: { :data => data }
      }
    end
  end
end
