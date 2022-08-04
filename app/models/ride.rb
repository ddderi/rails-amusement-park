class Ride < ActiveRecord::Base
    belongs_to :attraction 
    belongs_to :user

    def take_ride
        
        if user.tickets.to_i > attraction.tickets.to_i and user.height.to_i > attraction.min_height.to_i
            return start_ride
        elsif attraction.tickets.to_i > user.tickets.to_i and attraction.min_height.to_i > user.height.to_i
            return not_enough_both
        elsif attraction.min_height.to_i > user.height.to_i
            return not_enough_tall
        else return not_enough_tickets
        end

    end

    def start_ride
        new_hap = user.happiness + attraction.happiness_rating
        new_nausea = user.nausea + attraction.nausea_rating
        new_tickets = user.tickets - attraction.tickets 
        user.update(happiness: new_hap, nausea: new_nausea, tickets: new_tickets)
        "Thanks for riding the #{attraction.name}!"
    end

    def not_enough_tall
        "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    def not_enough_tickets
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    def not_enough_both
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

end
