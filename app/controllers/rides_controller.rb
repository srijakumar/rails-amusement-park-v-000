class RidesController < ApplicationController

before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def new
      @ride = Ride.new
      @rides = Ride.all
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])

    if @ride.save
      if @ride.user.admin
        redirect_to attraction_path(@ride.attraction)
      else
        redirect_to user_path(current_user), notice: @ride.take_ride
      end
    else
      redirect_to attraction_path(attraction), notice: "#{@ride.attraction.name} was not ridden"
    end
  end

  def show
  end

  def edit

  end

  def update
    if @ride.update(ride_params)
      redirect_to @ride
    else
      render :edit
    end
  end

  def destroy
    @ride.destroy
    redirect_to rides_url
  end


private

def set_ride
  @ride = Ride.find_by(id: params[:id])
end

def ride_params
   params.require(:ride).permit(:user_id, :attraction_id, :created_at, :updated_at)
end


end
