class Api::V1::Merchants::FindController < ApplicationController
  def index
    render json: Merchant.find_by(name: params["name"].capitalize)
  end
end
