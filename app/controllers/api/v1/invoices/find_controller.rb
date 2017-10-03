class Api::V1::Invoices::FindController < ApplicationController
  def index
    if params["status"]
      render json: Invoice.where(
      "lower(status) = ?", params["status"].downcase)
      .first
    elsif params["id"]
      render json: Invoice.find(params["id"])
    elsif params["customer_id"]
      render json: Invoice.find_by(customer_id: params["customer_id"])
    elsif params["merchant_id"]
      render json: Invoice.find_by(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      render json: Invoice.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      render json: Invoice.find_by(updated_at: params["updated_at"])
    end
  end
end
