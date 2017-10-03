class Customer < ApplicationRecord
  acts_as_copy_target
  has_many :invoices
end
