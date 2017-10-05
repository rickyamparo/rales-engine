class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def revenue(filter = nil)
    Invoice
    .where(filter)
    .merge(Transaction.success)
    .joins(:invoice_items, :transactions)
    .sum("quantity * unit_price")
  end

  def self.favorite_customer(filter = nil)
    results =
    Invoice
    .where(filter)
    .group('customer_id')
    .count
    Customer.find(results.key(results.values.max))
  end
end
