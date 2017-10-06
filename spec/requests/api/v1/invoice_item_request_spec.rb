require 'rails_helper'

describe "Invoice Items API" do
  before(:each) do
    merchant = Merchant.create(id: 1, name: "Timmy")
    customer = Customer.create(id: 1, first_name: "Pauly", last_name: "Shore")
    item = Item.create(id: 1, name: "Hula Hoop", merchant_id: merchant.id)
    invoice = merchant.invoices.create(
      id: 1,
      customer: customer,
      merchant: merchant,
      status: "shipped",
      created_at: '2012-02-27 14:53:59 UTC'
    )
    id = 0
    3.times do
      invoice.invoice_items.create(
        id: id += 1,
        item_id: item.id,
        quantity: 2,
        unit_price: 2900,
        created_at: '2012-03-27 14:53:59 UTC'
      )
    end
  end

  context "GET /invoice_items" do
    it "sends a list of invoice_items" do
      get '/api/v1/invoice_items'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['unit_price']).to eq("29.00")
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /invoice_items/:id" do
    it "sends data on an invoice_item" do
      get '/api/v1/invoice_items/1'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['unit_price']).to eq("29.00")
    end
  end

  context "GET /invoice_items/find?invoice_id=1" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find?invoice_id=1'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['unit_price']).to eq("29.00")
    end
  end

  context "GET /invoice_items/find_all?invoice_id=1" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find_all?invoice_id=1'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['unit_price']).to eq("29.00")
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /invoice_items/find?item_id=1" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find?item_id=1'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['unit_price']).to eq("29.00")
    end
  end

  context "GET /invoice_items/find_all?item_id=1" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find_all?item_id=1'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['unit_price']).to eq("29.00")
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /invoice_items/find?quantity=2" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find?quantity=2'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['unit_price']).to eq("29.00")
    end
  end

  context "GET /invoice_items/find_all?quantity=2" do
    it "sends data on an invoice_item meeting the search criteria" do
      get '/api/v1/invoice_items/find_all?quantity=2'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['unit_price']).to eq("29.00")
      expect(invoice_items.count).to eq(3)
    end
  end
end
