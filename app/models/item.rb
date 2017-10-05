class Item < ApplicationRecord
  acts_as_copy_target
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_item(params)
    if params["name"]
      where(
      "lower(name) = ?", params["name"].downcase)
      .first
    elsif params["id"]
      find(params["id"])
    elsif params["description"]
      find_by(description: params["description"])
    elsif params["unit_price"]
      find_by(unit_price: params["unit_price"])
    elsif params["merchant_id"]
      find_by(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      find_by(updated_at: params["updated_at"])
    end
  end

  def self.most_revenue(quantity = 5)
    joins(invoice_items: [invoice:[:transactions]])
    .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .where('transactions.result = ?', 'success')
    .order('revenue desc')
    .group(:id)
    .limit(quantity)
  end

  def self.most_items(quantity = 5)
    joins(invoice_items: [invoice: [:transactions]])
    .select('items.*, sum(invoice_items.quantity) AS most_items')
    .where('transactions.result = ?', 'success')
    .order('most_items desc')
    .group(:id)
    .limit(quantity)
  end

end
