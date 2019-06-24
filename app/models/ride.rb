class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #byebug
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    end
    if user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    end
    if user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    end

    @ride = Ride.new
    #@user = User.find_by(name: params[:user][:name])

    #params[:user][:happiness] = self.user.happiness + self.attraction.happiness_rating,
    #params[:user][:nausea] = self.user.nausea + self.attraction.nausea_rating,
    #params[:user][:ticket] = self.user.tickets - self.attraction.tickets

    @ride.user.update(
    :happiness => self.user.happiness + self.attraction.happiness_rating,
    :nausea => self.user.nausea + self.attraction.nausea_rating,
    :ticket => self.user.tickets - self.attraction.tickets
    )

  end
end
