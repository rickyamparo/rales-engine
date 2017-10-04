require 'rails_helper'

describe "Merchants Business Intelligence API" do
  before(:each) do
    @merchant = Merchant.create(id: 1, name: "Timmy")
    customer = Customer.create(id: 1, first_name: "Pauly", last_name: "Shore")
    item = Item.create(id: 1, merchant_id: 1, name: 'Sofa')
    good_invoice = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
      )
    bad_invoice = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
    )
    one_month_later_good_invoice = @merchant.invoices.create(
      customer: customer,
      merchant: @merchant,
      status: "shipped"
      )

    3.times do
      good_invoice.invoice_items.create(
        item_id: item.id,
        quantity: 2,
        unit_price: 50
      )
      bad_invoice.invoice_items.create(
        item_id: item.id,
        quantity: 2,
        unit_price: 100
      )
      one_month_later_good_invoice.invoice_items.create(
        item_id: item.id,
        quantity: 4,
        unit_price: 75
      )

    end
    good_invoice.transactions.create(
      credit_card_number: '666',
      result: "success",
      created_at: '2012-03-27 14:53:59 UTC'
    )
    one_month_later_good_invoice.transactions.create(
      credit_card_number: '666',
      result: "success",
      created_at: '2012-04-27 14:53:59 UTC'
    )
    bad_invoice.transactions.create(
      credit_card_number: '666',
      result: "failed",
      created_at: '2012-03-27 14:53:59 UTC'
    )
  end
  context "GET /merchants/:id/revenue" do
    it "returns the total revenue for that merchant across successful transactions" do

      get "/api/v1/merchants/#{@merchant.id}/revenue"

      merchant_revenue = JSON.parse(response.body)
      expect(response).to be_success
      expect(merchant_revenue["revenue"]).to eq(1200)
    end
  end
  context "GET /merchants/:id/revenue" do
    xit "returns the total revenue for that merchant across successful transactions" do

      date = "2012-03-27 14:53:59 UTC"
      get "/api/v1/merchants/#{@merchant.id}/revenue?date=#{date}"

      merchant_revenue = JSON.parse(response.body)

      expect(response).to be_success

      expect(merchants_revenue['total']).to eq("$300.00")
    end
  end
end
