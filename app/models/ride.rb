class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    end

    updated_tickets = self.user.tickets - self.attraction.tickets
    updated_nausea = self.user.nausea + self.attraction.nausea_rating
    updated_happiness = self.user.happiness + self.attraction.happiness_rating

    self.user.update(tickets: updated_tickets, nausea: updated_nausea, happiness: updated_happiness)
  end


end
