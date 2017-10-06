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
  context "GET /merchants/:id" do
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
  context "GET /merchants/find_all?name=johann" do
    it "sends data on all merchants meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann")

      get "/api/v1/merchants/find_all?name=johann"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find?id=1" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(id: 1, name: "Johann")

      get "/api/v1/merchants/find?id=1"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find_all?id=1" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(id: 1, name: "Johann")

      get "/api/v1/merchants/find_all?id=1"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find?created_at=2012-03-27%2014:53:59%20UTC" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann", created_at: '2012-03-27 14:53:59 UTC')

      get "/api/v1/merchants/find?created_at=2012-03-27%2014:53:59%20UTC"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find_all?created_at=2012-03-27%2014:53:59%20UTC" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann", created_at: "2012-03-27 14:53:59 UTC")

      get "/api/v1/merchants/find_all?created_at=2012-03-27%2014:53:59%20UTC"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find?updated_at=2012-03-27%2014:53:59%20UTC" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann", updated_at: "2012-03-27 14:53:59 UTC")

      get "/api/v1/merchants/find?updated_at=2012-03-27%2014:53:59%20UTC"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq("Johann")
    end
  end
  context "GET /merchants/find_all?updated_at=2012-03-27%2014:53:59%20UTC" do
    it "sends data on a merchant meeting the search criteria" do

      2.times do
        Merchant.create(name: "Timmy")
      end

      Merchant.create(name: "Johann", updated_at: "2012-03-27 14:53:59 UTC")

      get "/api/v1/merchants/find_all?updated_at=2012-03-27%2014:53:59%20UTC"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first['name']).to eq("Johann")
    end
  end
end
