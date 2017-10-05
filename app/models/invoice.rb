class Invoice < ApplicationRecord
  acts_as_copy_target
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.find_invoice(params)
    find_by(params)
  end

  def self.find_all(params)
    where(params)
  end
end
