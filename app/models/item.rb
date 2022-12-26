class Item < ApplicationRecord

  validates :title, :description, :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id, :item_fee, presence: true

  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
