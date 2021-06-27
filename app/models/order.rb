class Order < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :parts
    validates :equipment
    validates :quantity
  end
end
