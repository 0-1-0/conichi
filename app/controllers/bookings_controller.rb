class BookingsController < ApplicationController
    def create
        render json: Booking.create! hotel: params[:hotel_name], user: current_user
    end
end
