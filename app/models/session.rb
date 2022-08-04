class Session < ApplicationRecord

    def current_user
        if !session[:name].nil?
            return session[:name]
        else 
            return "Jeune inconnu, veuillez sign-up"
        end
    end
end
