class Merchant < ApplicationRecord
  self.primary_key = :id
  acts_as_copy_target
end
