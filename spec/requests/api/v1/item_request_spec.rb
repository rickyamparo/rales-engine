require 'rails_helper'

describe "Items API" do
  context "GET /items" do
    it "sends a list of items" do
      3.times do
        Item.create(name: "Hula Hoop")
      end

      get '/api/v1/items'

      merchants = Json.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq("Hula Hoop")
      expect(items.count).to eq(3)
    end
  end
end
