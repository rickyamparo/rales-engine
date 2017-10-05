class Item < ApplicationRecord
  acts_as_copy_target
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_item(params)
    find_by(params)
  end

  def self.find_all(params)
    where(params)
  end

  def self.most_revenue(quantity = 1)
    select('items.*, invoice_items.quantity * invoice_items.unit_price AS revenue')
    .joins(:invoice_items)
    .distinct.order('revenue desc')
    .first(quantity)
  end
end
