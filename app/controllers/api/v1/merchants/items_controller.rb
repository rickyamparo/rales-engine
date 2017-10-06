class Api::V1::Merchants::ItemsController <ApplicationController
  def index
    merchant = Merchant.find(merchant_params[:merchant_id])
    render json: Item.where(merchant_id: merchant.id)
  end

  private

  def merchant_params
    params.permit(:merchant_id)
  end
end
