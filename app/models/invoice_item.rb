class InvoiceItem < ApplicationRecord
  acts_as_copy_target
  belongs_to :item
  belongs_to :invoice
end
