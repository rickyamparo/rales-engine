class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices

  def total_revenue
    hash = self.as_json
    hash["revenue"] = Invoice
    .where(merchant_id: id)
    .joins(:invoice_items)
    .joins(:transactions)
    .select('invoice_items.quantity * invoice_items.unit_price AS total_value')
    .where('transactions.result = ?', 'success')
    .map(&:total_value)
    .reduce(:+)
    hash
  end
end
