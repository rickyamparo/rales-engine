class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all.select(:id, :name)
    #refactor to use serialize
  end
  def show
    render json: Merchant.find(params[:id])
  end
end
