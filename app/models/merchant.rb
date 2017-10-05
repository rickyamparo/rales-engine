class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices

  def revenue(filter = nil)
    Invoice
    .where(filter)
    .merge(Transaction.success)
    .joins(:invoice_items, :transactions)
    .sum("quantity * unit_price")
  end

  def self.favorite_customer(filter = nil)
    Invoice
    .where(filter)
    .merge(Transaction.success)
    .joins(:invoice_items, :transactions)
    .max('count(customer_id)')
  end
end
