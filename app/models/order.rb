class Order < ApplicationRecord
  belongs_to :user
  has_many :accessories, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :order_overviews, dependent: :destroy
  has_many :attachements, dependent: :destroy
end
