class Api::V1::FavoriteCustomerController < ApplicationController
  def index
    binding.pry
    render json: Merchant.favorite_customer(merchant_params)
  end

private
  def merchant_params
    params.permit(:merchant_id)
  end
end
