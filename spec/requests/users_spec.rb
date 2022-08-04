require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /mood" do
    it "returns http success" do
      get "/users/mood"
      expect(response).to have_http_status(:success)
    end
  end

end
