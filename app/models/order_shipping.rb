class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order, :postal_code, :prefecture_id, :municipality, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/, message: " is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: " can't be blank"}
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: " is invalid"}
    validates :token, presence: { message: " can't be blank"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
