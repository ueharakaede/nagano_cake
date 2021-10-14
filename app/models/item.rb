class Item < ApplicationRecord

  attachment :image
  belongs_to :genre
  has_many :order_datails, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
