require 'rails_helper'
require 'rest-client'

RSpec.describe "Regions" do
  describe "GET /index" do
    
    it "returns http success" do
      resp = RestClient.get("https://brasilapi.com.br/api/ibge/uf/v1")
      expect(resp.code).to eq(200)
    end

  end

  describe "GET /show" do

    it "returns http success" do
      code = '35'
      resp = RestClient.get("https://brasilapi.com.br/api/ibge/uf/v1/#{code}")
      expect(resp).to include('São Paulo')
    end

  end


  describe "POST /create" do
    
    it "create states" do
      RestClient.post "https://brasilapi.com.br/api/ibge/uf/v1", {param1: 'one', nested: {param2: 'two'}}
      
    end

  end
end
