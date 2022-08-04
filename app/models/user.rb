class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    # has_secure_password
    validates :password, presence: true

    def mood
        if self.nausea.to_i > self.happiness.to_i
            return "sad"
        else 
            return "happy"
        end
       
    end
end
