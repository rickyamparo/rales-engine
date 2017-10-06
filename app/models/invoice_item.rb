class InvoiceItem < ApplicationRecord
  acts_as_copy_target
  belongs_to :item
  belongs_to :invoice

  def self.find_invoice_item(params)
    find_by(params)
  end

  def self.find_all(params)
    where(params)
  end
  
end
