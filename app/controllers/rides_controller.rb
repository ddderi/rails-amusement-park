class RidesController < ApplicationController
  def show
    @ride = Ride.find(params[:id])
  end

  def new

  end

  def create
    
    @ride = Ride.create(ride_params)
    message = @ride.take_ride
    # @attraction = Attraction.find_by(id: params[:attraction_id])
    redirect_to user_path(@ride.user), flash: { message: message }

  end

  private 
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
