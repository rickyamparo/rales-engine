class Invoice < ApplicationRecord
  acts_as_copy_target
  belongs_to :customer
  belongs_to :merchant
end
