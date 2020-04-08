class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item

  validates :quantity, numericality: {greater_than: 0}
end
