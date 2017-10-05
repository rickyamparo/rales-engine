class Customer < ApplicationRecord
  acts_as_copy_target
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(filter = nil)
    results =
    Invoice
    .where(filter)
    .group('merchant_id')
    .count
    Merchant.find(results.key(results.values.max))
  end

  def self.find_customer(params)
    find_by(params)
  end

  def self.find_all(params)
    where(params)
  end

end
