require 'rails_helper'

require 'rails_helper'

describe "Invoices API" do
    context "GET /invoices" do
      it "sends a list of invoices" do
      customer = Customer.create(name: "Joe")
      merchant = Merchant.create(name: "Timmy")
      3.times do
          Invoice.create(
            customer: customer,
            merchant: merchant,
            status: 'complete'
          )
      end

      get '/api/v1/invoices'

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.first['status']).to eq("complete")
      expect(invoices.count).to eq(3)
    end
  end
  context "GET /invoices/:id" do
    it "sends a single invoice" do
    customer = Customer.create(name: "Joe")
    merchant = Merchant.create(name: "Timmy")
    3.times do
        Invoice.create(
          customer: customer,
          merchant: merchant,
          status: 'complete'
        )
    end

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.first['status']).to eq("complete")
    expect(invoices.count).to eq(1)
    end
  end
end

  # id,customer_id,merchant_id,status,created_at,updated_at
