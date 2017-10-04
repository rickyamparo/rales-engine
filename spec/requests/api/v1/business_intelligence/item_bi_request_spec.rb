# GET /api/v1/items/most_revenue?quantity=x
 # returns the top x items ranked by total revenue generated

require 'rails_helper'

describe "Items Business Intelligence API" do
  before(:each) do
    @merchant = Merchant.create(id: 1, name: "Toki")
    customer = Customer.create(id: 1, first_name: "Skwisgar", last_name: "Skwigelf")
    item_1 = Item.create(id:1, merchant_id: 1, name: "Wartooth")
    item_2 = Item.create(id:2, merchant_id: 1, name: "Guitar")
    item_3 = Item.create(id:3, merchant_id: 1, name: "Metal")
    invoice_1 = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
    )
    invoice_2 = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
    )
    invoice_3 = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
    )

    3.times do
      invoice_1.invoice_items.create(
        item_id: item_1.id,
        quantity: 4,
        unit_price: 50
      )
      invoice_2.invoice_items.create(
        item_id: item_2.id,
        quantity: 3,
        unit_price: 50
      )
      invoice_3.invoice_items.create(
        item_id: item_3.id,
        quantity: 2,
        unit_price: 50
      )
    end
  end

  context "GET /items/most_revenue?quantity=1" do
    it "returns the top 1 items ranked by total revenue generated" do
      get "/api/v1/items/most_revenue?quantity=1"

      top_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(top_items.first['name']).to eq("Wartooth")
      expect(top_items.last['name']).to eq("Wartooth")
    end
    it "returns the top 2 items ranked by total revenue generated" do
      get "/api/v1/items/most_revenue?quantity=2"

      top_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(top_items.count).to eq(2)
      expect(top_items.first['name']).to eq("Wartooth")
      expect(top_items.second['name']).to eq("Guitar")
    end
    it "returns the top 3 items ranked by total revenue generated" do
      get "/api/v1/items/most_revenue?quantity=3"

      top_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(top_items.count).to eq(3)
      expect(top_items.first['name']).to eq("Wartooth")
      expect(top_items.second['name']).to eq("Guitar")
      expect(top_items.third['name']).to eq("Metal")
    end
  end
end
