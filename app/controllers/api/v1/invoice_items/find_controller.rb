class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    render json: InvoiceItem.find_invoice_item(invoice_item_params)
  end

  private
  def invoice_item_params
    params.permit(:invoice_id, :id, :item_id, :result, :quantity, :unit_price, :created_at, :updated_at)
  end
end
