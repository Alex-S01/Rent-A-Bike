class BookingsController < ApplicationController
    def index
      @bike = Bike.find_by(id: params[:bike_id])
      if @bike.present?
        @bookings = @bike.bookings
      else
        @bookings = current_user.bookings
      end
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def new
      @bike = Bike.find(params[:bike_id])
    end

    def create
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.new(booking_params)
      @booking.bike = @bike
      @booking.user = current_user
      @booking.save
      redirect_to bookings_path
    end

    def edit
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.find(params[:id])
    end

    def update
      @bike = Bike.find(params[:bike_id])
      @booking = Booking.find(params[:id])
      @booking.bike = @bike
      
      @booking.update(booking_params)
    
      redirect_to bookings_path
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy

      redirect_to bookings_path
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end

end
