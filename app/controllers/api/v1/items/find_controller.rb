class Api::V1::Items::FindController < ApplicationController
  def index
    render json: Item.find_item(item_params)
  end

  private
  def item_params
    if params[:unit_price]
      params[:unit_price].delete!('.')
    end
    params.permit(:id, :name,
      :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
