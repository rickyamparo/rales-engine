class Api::V1::Invoices::FindAllController < ApplicationController
  def index
    if params["status"]
      render json: Invoice.where(
      "lower(status) = ?", params["status"].downcase)
    elsif params["id"]
      render json: Invoice.where(id: params["id"])
    elsif params["customer_id"]
      render json: Invoice.where(customer_id: params["customer_id"])
    elsif params["merchant_id"]
      render json: Invoice.where(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      render json: Invoice.where(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Invoice.where(updated_at: params["updated_at"])
    end
  end
end
