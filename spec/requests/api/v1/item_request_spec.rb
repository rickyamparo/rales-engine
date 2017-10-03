require 'rails_helper'

describe "Items API" do
  context "GET /api/v1/items"
    it "sends a list of items" do
      merchant = Merchant.create(name: "Jerry")

      3.times do
        Item.create(name: "Hula Hoop", merchant_id: merchant.id)
      end

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq("Hula Hoop")
      expect(items.count).to eq(3)
    end

    context "GET /api/v1/items/:id"
      it "sends data on an item" do
        merchant = Merchant.create(name: "Jerry")
        Item.create(name: "Glengoolie Blue", merchant_id: merchant.id)

        3.times do
          Item.create(name: "Hula Hoop", merchant_id: merchant.id)
        end

        get "/api/v1/items/#{Item.first.id}"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Glengoolie Blue")
      end

    context "GET /merchants/find?name=Glengoolie%20Blue"
      it "sends data on a item meeting the search criteria" do
        merchant = Merchant.create(name: "Jerry")
        Item.create(name: "Glengoolie Blue", merchant_id: merchant.id)

        3.times do
          Item.create(name: "Hula Hoop", merchant_id: merchant.id)
        end

        get "/api/v1/items/find?name=Glengoolie Blue"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Glengoolie Blue")
      end
end
