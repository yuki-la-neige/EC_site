class Item < ApplicationRecord
  attachment :image
  belongs_to :genre

  validates :genre_id, :name, :price, presence: true
end
