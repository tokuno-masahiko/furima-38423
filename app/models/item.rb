class Item < ApplicationRecord
  validates :image, :title, :description, :item_fee, :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :item_fee,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is invalid' }

end
