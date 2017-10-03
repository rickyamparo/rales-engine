class Item < ApplicationRecord
  acts_as_copy_target
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_item

  def self.find_item(params)
    if params["name"]
      where(
      "lower(name) = ?", params["name"].downcase)
      .first
    elsif params["id"]
      find(params["id"])
    elsif params["description"]
      find_by(description: params["description"])
    elsif params["unit_price"]
      find_by(unit_price: params["unit_price"])
    elsif params["merchant_id"]
      find_by(merchant_id: params["merchant_id"])
    elsif params["created_at"]
      find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      find_by(updated_at: params["updated_at"])
    end
  end
end
