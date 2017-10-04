class Api::V1::RevenueController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.total_revenue.as_json
  end
end
