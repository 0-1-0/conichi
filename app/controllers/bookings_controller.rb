class BookingsController < ApplicationController
    def create
        render json: Booking.create!(hotel: params[:hotel_name], user: current_user)
    end

    def show
        render json: Booking.all
    end

    def show_by_user
        render json: User.find(params[:user_id]).bookings
    end
end
