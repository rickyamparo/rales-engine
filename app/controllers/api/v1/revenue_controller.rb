class Api::V1::RevenueController < ApplicationController
  def index
    if merchant_params[:created_at]
      revenue = Merchant.find(params[:merchant_id]).revenue(merchant_params)
    else
      revenue = Merchant.find(params[:merchant_id]).revenue(merchant_params)
    end
    render json: revenue, :serializer => TotalRevenueSerializer
  end

  private
  def merchant_params
    if params[:date]
      params[:created_at] = params[:date]
      params.permit(:merchant_id, :created_at)
    else
      params.permit(:merchant_id)
    end
  end
end
