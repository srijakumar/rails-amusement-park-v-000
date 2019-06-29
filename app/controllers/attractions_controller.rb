class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create

  end

  def update

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
