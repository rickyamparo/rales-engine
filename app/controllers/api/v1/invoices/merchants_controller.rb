class Api::V1::Invoices::MerchantsController < ApplicationController
  def index
    invoice = Invoice.find(invoice_params[:invoice_id].to_i)
    render json: Merchant.find(invoice.merchant_id)
  end

  private

  def invoice_params
    params.permit(:invoice_id)
  end
end