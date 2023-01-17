class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :house_number, :phone_number, :user_id, :item_id, :token, :purchase_id
  
  with_options presence: true do
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is invalid'}
    validates :user_id, :city, :address, :prefecture_id, :token, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end