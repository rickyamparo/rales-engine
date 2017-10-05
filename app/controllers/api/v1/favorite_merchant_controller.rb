class Api::V1::FavoriteMerchantController < ApplicationController

  def index
    render json: Customer.favorite_merchant(customer_params)
  end

  private

  def customer_params
    params.permit(:customer_id)
  end

end
