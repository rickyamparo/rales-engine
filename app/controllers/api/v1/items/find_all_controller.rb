class Api::V1::Items::FindAllController < ApplicationController
  def index
    if params["name"]
      render json: Item.where(
      "lower(name) = ?", params["name"].downcase)
    elsif params["id"]
      render json: Item.where(id: params["id"])
    elsif params["description"]
      render json: Item.where(description: params["description"])
    elsif params["unit_price"]
      render json: Item.where(unit_price: params["unit_price"])
    elsif params["merchant_id"]
      render json: Item.where(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      render json: Item.where(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Item.where(updated_at: params["updated_at"])
    end
  end
end
