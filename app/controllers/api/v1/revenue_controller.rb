class Api::V1::RevenueController < ApplicationController
  def index
    if params['created_at']
      revenue = Merchant.find(merchant_params[:merchant_id])
      .revenue(merchant_params)
    else
      revenue = Merchant.find(merchant_params[:merchant_id]).revenue
    end
    render json: revenue, :serializer => TotalRevenueSerializer
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
