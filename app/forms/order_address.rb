class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name,:phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0}
    validates :city, presence: true
    validates :house_number, presence: true
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  validates :price, numericality: { greater_than_or_equal_to: 299, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  def save
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
  end

end