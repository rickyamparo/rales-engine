class Api::V1::BestDayController < ApplicationController
  def index
    render json: Item.find(item_params).best_day
  end
  
 private
  
  def item_params
    params.permit(:id)
  end
  
end
