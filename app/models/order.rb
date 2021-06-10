class Order < ApplicationRecord
  # belongs_to :user
  has_many :accessories, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :order_overviews, dependent: :destroy
  has_many :attachements, dependent: :destroy

  accepts_nested_attributes_for :accessories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :order_overviews, reject_if: :all_blank, allow_destroy: true
  # proc {|attributes| attributes['equipment'].blank? and attributes['parts'].blank? and attributes['numeral'].blank? and attributes['identification'].blank?}, 
end
