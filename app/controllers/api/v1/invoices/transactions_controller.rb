class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    render json: Transaction.find_transaction(transaction_params[:invoice_id])
  end

  private

  def transaction_params
    params.permit(:invoice_id)
  end
end
