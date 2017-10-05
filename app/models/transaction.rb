class Transaction < ApplicationRecord
  acts_as_copy_target
  belongs_to :invoice

  scope :success, ->{ where(result: 'success') }
  scope :failure, ->{ where(result: 'failure') }
end
