class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides

    validates :password, :presence => true
    #validates :admin, :presence => true

    def mood
    #  if
    #    return 'happy'
    #  else
    #    return 'sad'
    #  end
    end
end
