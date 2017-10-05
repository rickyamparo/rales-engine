class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.find_customer(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name)
  end
end
