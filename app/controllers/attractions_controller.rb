class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]


  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
    @attractions = Attraction.all
  end

  def edit
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    end
  end

  def update
    if @attraction.update(attraction_params)
      render :show
       redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url
  end

  private
      def set_attraction
        @attraction = Attraction.find(params[:id])
      end

      def attraction_params
        params.require(:attraction).permit(
       :name,
       :min_height,
       :tickets,
       :happiness_rating,
       :nausea_rating
      )
    end


end
