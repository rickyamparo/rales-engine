class Merchant < ApplicationRecord
  acts_as_copy_target
  has_many :items
  has_many :invoices
end
