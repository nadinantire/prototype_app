class Contractor < ApplicationRecord
  belongs_to :order_confirmation

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :tax, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :due_on
  end
end
