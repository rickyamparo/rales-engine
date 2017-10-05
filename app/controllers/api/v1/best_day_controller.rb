class Api::V1::BestDayController < ApplicationController
  def index
    render json: Item.find(params[:item_id]).best_day
  end

  private

  def item_params
    params.permit(:item_id)
  end

end
