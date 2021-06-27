class OrderConfirmation < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  has_many :contractors, dependent: :destroy

  accepts_nested_attributes_for :contractors, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :firm
    validates :department
    validates :name
    validates :title
    validates :acceptance_on
  end
end
