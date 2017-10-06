class InvoiceItem < ApplicationRecord
  acts_as_copy_target
  belongs_to :item
  belongs_to :invoice

  def self.find_invoice_item(params)
    if params["unit_price"]
      params["unit_price"] = (params["unit_price"].to_f * 100)
      find_by(params)
    else
      find_by(params)
    end
  end

  def self.find_all(params)
    if params["unit_price"]
      params["unit_price"] = (params["unit_price"].to_f * 100)
      where(params)
    else
      where(params)
    end
  end

end
