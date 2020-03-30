class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items

  validates :genre_id, :name, :price, presence: true
end
