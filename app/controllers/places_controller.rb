require 'open-uri'
require 'openssl'

class PlacesController < ApplicationController
def location
    respond_to do |format|
      format.json {
        lat = params["lat"].to_f
        lng = params["lng"].to_f
        @client = GooglePlaces::Client.new("AIzaSyBrl7pY8K15caxHLJ3D8_-uSiXXLuZos0c")
        spots = @client.spots(lat, lng, types: :lodging).map{ |spot| 
            {
                name: spot['name'], 
                address: (spot['vicinity'] || ''),
                rating: spot['rating'],
                photos: spot.try('photos').map{|photo| photo.try('photo_reference')}
            }
        }
        render json: { :data => spots }
      }
    end
  end

    def image_proxy
        key = params[:reference]
        binary = Rails.cache.fetch(key) do
            image_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=#{key}&key=AIzaSyBrl7pY8K15caxHLJ3D8_-uSiXXLuZos0c"
            response.headers['Cache-Control'] = "public, max-age=#{84.hours.to_i}"
            response.headers['Content-Type'] = 'image/png'
            response.headers['Content-Disposition'] = 'inline'
            open(image_url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
        end
        render :text => binary
    end
end
