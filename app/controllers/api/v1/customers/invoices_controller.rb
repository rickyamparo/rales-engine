class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    customer = Customer.find(customer_params[:customer_id])
    render json: Invoice.where(customer_id: customer.id)
  end

  private

  def customer_params
    params.permit(:customer_id)
  end
end
