class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.find_all(item_params)
    render json: invoice_items
  end

  private

  def item_params
    params.permit(:invoice_id)
  end
end
