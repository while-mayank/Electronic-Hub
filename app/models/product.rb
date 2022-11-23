class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
