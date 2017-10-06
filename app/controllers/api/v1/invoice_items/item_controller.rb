class Api::V1::InvoiceItems::ItemController < ApplicationController
  def index
    invoice = Invoice.find(invoice_item_params[:invoice_item_id].to_i)
    render json: invoice
  end

  private

  def invoice_item_params
    params.permit(:invoice_item_id)
  end
end
