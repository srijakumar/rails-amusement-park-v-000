class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    byebug
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    end

    if user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    end

    if user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    end


  end



end
