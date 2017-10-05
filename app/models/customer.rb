class Customer < ApplicationRecord
  acts_as_copy_target
  has_many :invoices
  has_many :transactions, through: :invoices
end
