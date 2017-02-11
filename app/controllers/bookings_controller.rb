class BookingsController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :create
    before_filter :authenticate_user!, only: :create

    def create
        puts current_user
        b = Booking.create!(hotel: params[:hotel_name], address: params[:address], user: current_user, start_date: Date.parse(params[:start_date]), end_date: Date.parse(params[:end_date]))
        if b.save
            render json: b
        else
            render json: b.errors, status: 422
        end 
    end

    def show
        render json: Booking.all
    end

    def show_by_user
        render json: User.find(params[:user_id]).bookings, include: 'user'
    end
end
