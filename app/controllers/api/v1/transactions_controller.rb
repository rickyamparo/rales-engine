class Api::V1::TransactionsController < ApplicationController
  def index
    invoice_id = invoice_params[:invoice_id].to_i
    transactions = Transaction.find_by(invoice_id: invoice_id)
    render json: transactions
  end

  private
  def invoice_params
    params.permit(:invoice_id)
  end
end
