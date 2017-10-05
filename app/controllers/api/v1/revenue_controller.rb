class Api::V1::RevenueController < ApplicationController
  def index
    if params['created_at']
      total_revenue = Merchant.find(merchant_params[:merchant_id]).total_revenue(merchant_params)
    else
      total_revenue = Merchant.find(merchant_params[:merchant_id]).total_revenue
    end
    render json: total_revenue, :serializer => TotalRevenueSerializer
  end

  private
  def merchant_params
    if params[:date]
      params[:created_at] = params[:date]
      params.permit(:merchant_id, :created_at)
    end
    params.permit(:merchant_id, :date)
  end
end
