require 'rails_helper'

describe "Customers API" do
  before(:each) do
    3.times do
     Customer.create(
       first_name: "Timmy",
       last_name: "Jones",
       created_at: '2012-03-27 14:54:09 UTC',
       updated_at: '2012-03-27 14:54:09 UTC'
        )
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
    end
    context "GET /customers/:id" do
      it "sends a customer" do

      get "/api/v1/customers/#{Customer.first.id}"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find?id=1" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find?id=#{Customer.first.id}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find?first_name=TIMMY" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find?first_name=#{Customer.first.first_name}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find?last_name=jONES" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find?last_name=#{Customer.first.last_name}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers['last_name']).to eq("Jones")
      end
    end

    context "GET /customers/find?created_at=2012-03-27%2014:54:09%20UTC" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find?created_at=2012-03-27%2014:54:09%20UTC"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers['first_name']).to eq("Timmy")
      end
    end

    context "GET /customers/find?updated_at=2012-03-27%2014:54:09%20UTC" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find?updated_at=2012-03-27%2014:54:09%20UTC"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers['first_name']).to eq("Timmy")
      end
    end

    context "GET /customers/find_all?created_at=2012-03-27%2014:54:09%20UTC" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?created_at=2012-03-27%2014:54:09%20UTC"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['first_name']).to eq("Timmy")
      end
    end

    context "GET /customers/find_all?updated_at=2012-03-27%2014:54:09%20UTC" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?updated_at=2012-03-27%2014:54:09%20UTC"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['first_name']).to eq("Timmy")
      end
    end

    context "GET /customers/find_all?id=1" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?id=#{Customer.first.id}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find_all?first_name=TIMMY" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?first_name=#{Customer.first.first_name}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['first_name']).to eq("Timmy")
      end
    end
    context "GET /customers/find_all?last_name=jONES" do
      it "sends data on all items meeting the search criteria" do
        get "/api/v1/customers/find_all?last_name=#{Customer.first.last_name}"

        customers = JSON.parse(response.body)

        expect(response).to be_success
        expect(customers.first['last_name']).to eq("Jones")
      end
    end
end
