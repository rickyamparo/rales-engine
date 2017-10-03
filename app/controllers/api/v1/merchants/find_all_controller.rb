class Api::V1::Merchants::FindAllController < ApplicationController
  def index
    if params["name"]
      render json: Merchant.where(name: params["name"])
    elsif params["id"]
      render json: Merchant.where(id: params["id"])
    elsif params["created_at"]
      render json: Merchant.where(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Merchant.where(updated_at: params["updated_at"])
    end
  end
end
