require 'rails_helper'

RSpec.describe "States", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/state/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/state/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/state/create"
      expect(response).to have_http_status(:success)
    end
  end

end
