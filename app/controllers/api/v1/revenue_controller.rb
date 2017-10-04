class Api::V1::RevenueController < ApplicationController
  def index
    filter = params[:merchant_id]
    total_revenue = Merchant.find(params[:merchant_id])
    .total_revenue
    render json: total_revenue, :serializer => TotalRevenueSerializer
  end
end
