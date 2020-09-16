class Item < ApplicationRecord
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, presence: true
  validates :status, presence: true
  validates :fee, presence: true
  validates :area, presence: true
  validates :days, presence: true
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, length: { minimum: 300 }, length: { minimum: 9999999 }, format: { with: VALID_PRICE_REGEX }
  validates :user, presence: true
end
