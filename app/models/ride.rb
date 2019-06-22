class Ride < ApplicationRecord
  belongs_to :users
  belongs_to :attractions
end
