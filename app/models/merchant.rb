class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_merchant(params)
    find_by(params)
  end

  def self.find_all(params)
    where(params)
  end

  def self.revenue(filter = nil, limit = 1)
    Invoice
    .where(filter)
    .merge(Transaction.success)
    .joins(:invoice_items, :transactions)
    .limit(limit)
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
