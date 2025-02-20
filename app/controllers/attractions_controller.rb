class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        # @user = User.find_by(id: params[:user_id])
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user)
    end

    def new
        @attraction = Attraction.new
    end


    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)

    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
        # @ride = @attraction.rides.build(user_id: current_user.id)
    end


    private 
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
