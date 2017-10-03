class Item < ApplicationRecord
  acts_as_copy_target
  belongs_to :merchant
end
