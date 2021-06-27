class Purchase < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one :order_confirmation, dependent: :destroy

  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :firm
    validates :department
    validates :name
    validates :acceptance_on
    validates :delivery
    validates :title
  end
end
