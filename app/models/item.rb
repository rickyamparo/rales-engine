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

  def best_day
    hash = {}
    hash['best_day'] = invoices.joins(:transactions)
    .select('invoices.created_at, sum(invoice_items.quantity) AS total')
    .where('transactions.result = ?', 'success')
    .group(:id)
    .order('total desc')
    .first.created_at
    hash
  end
end
