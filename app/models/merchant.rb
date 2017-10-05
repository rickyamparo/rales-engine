class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices


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

  def self.most_revenue(limit)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.success)
    .group('merchants.name')
    .select("merchants.id, merchants.name, sum(quantity * unit_price) as quantity_sum")
    .order('quantity_sum DESC')
    .group('merchants.id')
    .limit(limit)
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
