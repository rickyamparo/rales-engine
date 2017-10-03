class Api::V1::Merchants::FindController < ApplicationController
  def index
    if params["name"]
      render json: Merchant.find_by(name: params["name"].capitalize)
    elsif params["id"]
      render json: Merchant.find(params["id"])
    elsif params["created_at"]
      render json: Merchant.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Merchant.find_by(updated_at: params["updated_at"])
    end
  end
end