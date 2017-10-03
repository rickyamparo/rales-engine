class Api::V1::Items::FindController < ApplicationController
  def index
    if params["name"]
      render json: Item.find_by(name: params["name"].capitalize)
    elsif params["id"]
      render json: Item.find(params["id"])
    elsif params["description"]
      render json: Item.find_by(description: params["description"])
    elsif params["unit_price"]
      render json: Item.find_by(unit_price: params["unit_price"])
    elsif params["merchant_id"]
      render json: Item.find_by(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      render json: Item.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Item.find_by(updated_at: params["updated_at"])
    end
  end
end
