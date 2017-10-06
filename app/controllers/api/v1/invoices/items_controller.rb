class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.find(invoice_id: item_params[:invoice_id].to_i)
    render json: invoice_items.items
  end

  private

  def item_params
    params.permit(:invoice_id)
  end
end
