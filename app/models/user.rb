class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides


    #validates :password, :presence => true
    #validates :admin, :presence => true

    def mood
      if (self.happiness < self.nausea)
        return 'sad'
      else
        return 'happy'
      end
    end

end
