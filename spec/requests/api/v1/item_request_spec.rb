require 'rails_helper'

describe "Items API" do

  before(:each) do
    id = 0
    merchant = Merchant.create(name: "Jerry")
    3.times do
        Item.create(
          id: id += 1,
          name: "Hula Hoop",
          merchant_id: merchant.id)
      end
    Item.create(
      id: id += 1,
      name: "Glengoolie Blue",
      merchant_id: merchant.id)
  end

  context "GET /api/v1/items"
    it "sends a list of items" do
      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq("Hula Hoop")
      expect(items.last['name']).to eq("Glengoolie Blue")
      expect(items.count).to eq(4)
    end

    context "GET /api/v1/items/:id"
      it "sends data on an item" do
        get "/api/v1/items/#{Item.last.id}"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Glengoolie Blue")
      end

    context "GET /items/find?name=Glengoolie%20Blue"
      it "sends data on a item meeting the search criteria" do
        get "/api/v1/items/find?name=Glengoolie%20blue"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Glengoolie Blue")
      end

    context "GET /items/find_all?name=Hula%20Hoop"
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/items/find_all?name=Hula%20Hoop"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.first['name']).to eq("Hula Hoop")
      end

    context "GET /items/find?id=1" do
      it "sends data on an item meeting the search criteria" do
        get "/api/v1/items/find?id=1"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Hula Hoop")
      end
    end

    context "GET /items/find_all?id=1"
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/items/find_all?id=1"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.first['name']).to eq("Hula Hoop")
        expect(items.count).to eq(1)
      end

    context "GET /items/find?created_at=2012-03-27%2014:53:59%20UTC"
      it "sends data on an item meeting the search criteria" do
        Item.create(id: 5, name: "Kunai", created_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)

        get "/api/v1/items/find?created_at=2012-03-27%2014:53:59%20UTC"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Kunai")
      end

    context "GET /items/find_all?created_at=2012-03-27%2014:53:59%20UTC"
      it "sends data on an item meeting the search criteria" do
        Item.create(id: 5, name: "Kunai", created_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)
        Item.create(id: 6, name: "Smoke Ball", created_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)

        get "/api/v1/items/find_all?created_at=2012-03-27%2014:53:59%20UTC"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.first['name']).to eq("Kunai")
        expect(items.last['name']).to eq("Smoke Ball")
      end

    context "GET /items/find?updated_at=2012-03-27%2014:53:59%20UTC"
      it "sends data on an item meeting the search criteria" do
        Item.create(id: 5, name: "Kunai", updated_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)

        get "/api/v1/items/find?updated_at=2012-03-27%2014:53:59%20UTC"

        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item['name']).to eq("Kunai")
      end

    context "GET /items/find_all?updated_at=2012-03-27%2014:53:59%20UTC"
      it "sends data on an item meeting the search criteria" do
        Item.create(id: 5, name: "Kunai", updated_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)
        Item.create(id: 6, name: "Smoke Ball", updated_at: '2012-03-27 14:53:59 UTC', merchant_id: Merchant.first.id)

        get "/api/v1/items/find_all?updated_at=2012-03-27%2014:53:59%20UTC"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.first['name']).to eq("Kunai")
        expect(items.last['name']).to eq("Smoke Ball")
      end
end
