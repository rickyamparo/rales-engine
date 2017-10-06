class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    merchant = Merchant.find(merchant_params[:merchant_id])
    render json: Invoice.where(merchant_id: merchant.id)
  end

  private

  def merchant_params
    params.permit(:merchant_id)
  end
end
