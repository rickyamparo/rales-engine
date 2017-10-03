require 'rails_helper'

describe "Merchants API" do
  context "GET /merchants" do
    it "sends a list of merchants" do
      3.times do
        Merchant.create(name: "Timmy")
      end

      get '/api/v1/merchants'

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.first['name']).to eq("Timmy")
      expect(merchants.count).to eq(3)
    end
  context "GET /merchants/:id"
    it "sends data on a merchant" do
      Merchant.create(name: 'Johnny')
      2.times do
        Merchant.create(name: "Timmy")
      end

      get "/api/v1/merchants/#{Merchant.first.id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq("Johnny")
    end
  end
end
