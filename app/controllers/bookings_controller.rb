class BookingsController < ApplicationController
    def index
      @bike = Bike.find_by(id: params[:bike_id])
      if @bike.present?
        @bookings = @bike.bookings
      else
        @bookings = Booking.all
      end
    end

    def show
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.find(params[:id])
    end

    def new
      @bike = Bike.find(params[:bike_id])
      @booking = @bike.bookings.build
    end

    def create
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.new(booking_params)
      @booking.bike = @bike
      @booking.user = current_user
      @booking.save
      redirect_to bike_booking_path(@bike, @booking)
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
