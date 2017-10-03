class Api::V1::Merchants::FindAllController < ApplicationController
  def index
    render json: Merchant.where(name: params["name"].capitalize)
  end
end
