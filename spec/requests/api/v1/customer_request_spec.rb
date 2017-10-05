require 'rails_helper'

describe "Customers API" do
  before(:each) do
    3.times do
     Customer.create(first_name: "Timmy", last_name: "Jones")
    end
  end
    context "GET /customers" do
      it "sends a list of customers" do

      get '/api/v1/customers'

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.first['first_name']).to eq("Timmy")
      expect(customers.count).to eq(3)
    end
    context "GET /customers/:id" do
      it "sends a customer" do

      get "/api/v1/customers/#{Customer.first.id}"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find?id=1"
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?id=1"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['first_name']).to eq("Timmy")
        expect(customers.count).to eq(1)
      end
  end
end
