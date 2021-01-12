class BookingsController < ApplicationController
    def index
      @bookings = Booking.all
    end

    def show
      @booking = Booking.find(params[:id])
    end


    def new
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.new
    end

    def create
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.new(booking_params)
      @booking.bike = @bike
      raise
      @booking.save
      redirect_to bike_booking_path(@bike)
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
