class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :fee_id, presence: true, numericality: { other_than: 1 }
  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :days_id, presence: true, numericality: { other_than: 1 }
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, :numericality => { :less_than_or_equal_to => 9999999 }, :numericality => { :greater_than_or_equal_to => 300 }, format: { with: VALID_PRICE_REGEX }
  validates :user, presence: true

end
