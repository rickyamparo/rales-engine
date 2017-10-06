class Api::V1::Transactions::FindController < ApplicationController
  def index
    render json: Transaction.find_transaction(transaction_params)
  end

  private
  def transaction_params
    params.permit(:credit_card_number, :id, :result, :created_at, :updated_at)
  end
end
