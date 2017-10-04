class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices

  def revenue(filter = nil, limit = 1)
    Invoice
    .where(filter)
    .joins(:invoice_items)
    .joins(:transactions)
    .merge(Transaction.success)
    .select('sum(invoice_items.quantity *
       invoice_items.unit_price) AS total_value')
    .order("total_value DESC")
    .limit(limit)
    .first
    .total_value
  end
end
