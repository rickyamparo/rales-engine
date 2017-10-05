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

  def self.revenue(filter = nil)
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

  def self.most_items(quantity = 5)
    joins(invoices: [:invoice_items, :transactions])
    .select('merchants.*, sum(invoice_items.quantity) AS most_items')
    .where('transactions.result = ?', 'success')
    .order('most_items desc')
    .group(:id)
    .limit(quantity)
  end

end
