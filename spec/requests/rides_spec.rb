require 'rails_helper'

RSpec.describe "Rides", type: :request do
  describe "GET /take_ride" do
    it "returns http success" do
      get "/rides/take_ride"
      expect(response).to have_http_status(:success)
    end
  end

end
