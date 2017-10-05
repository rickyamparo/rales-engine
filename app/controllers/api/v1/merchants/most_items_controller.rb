class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    quantity = merchant_params['quantity']
    render json: Merchant.most_items(quantity)
  end

  def merchant_params
    params.permit(:quantity)
  end

end
