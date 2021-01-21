class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      if params[:query].present?
        sql_query = "\
        model @@ :query \
        OR condition @@ :query \
        "
        @bikes = Bike.where(sql_query, query:  "%#{params[:query]}%")
        @markers = @bikes.geocoded.map do |bike|
          {
            lat: bike.latitude,
            lng: bike.longitude
          }
        end
      else
        @bikes = Bike.all
        @markers = @bikes.geocoded.map do |bike|
          {
            lat: bike.latitude,
            lng: bike.longitude
          }
        end
        binding.pry
      end
    end

    def show
      @bike = Bike.find(params[:id])
    end

    def new
      @bike = Bike.new
    end

    def create
      @bike = Bike.new(bike_params)
      @bike.user = current_user
      if
        @bike.save
        redirect_to bikes_path
      else
        render :new
      end
    end

    def my_bikes
      @bikes = Bike.where(user_id: current_user.id)
    end

    private

    def bike_params
      params.require(:bike).permit(:model, :condition, :price, :photo)
    end
end
