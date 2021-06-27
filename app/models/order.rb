class Order < ApplicationRecord
  belongs_to :user
  has_many :accessories, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :order_overviews, dependent: :destroy
  has_many :attachements, dependent: :destroy

  accepts_nested_attributes_for :accessories, :order_overviews, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :quantity
    validates :delivery
    validates :remarks
    validates :acceptance_on
  end
end
