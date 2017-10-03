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
  end
  context "GET /merchants/find?name=Johann" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann")

      get "/api/v1/merchants/find?name=johann"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq("Johann")
    end
  end
end
