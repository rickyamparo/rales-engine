class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.find_by(invoice_id: item_params[:invoice_id].to_i)
    render json: Item.find(invoice_items.item_id)
  end

  private

  def item_params
    params.permit(:invoice_id)
  end
end
