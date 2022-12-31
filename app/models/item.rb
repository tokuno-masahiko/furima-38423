class Item < ApplicationRecord

  validates :title, :description, :item_fee, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :item_fee, numericality: { in: 300..9999999 },format: { with: /\A[0-9]+\z/ }

  validates :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
