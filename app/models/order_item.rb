class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status:{
    unable:     0, #着手不可
    waiting:    1, #制作待ち
    producing:  2, #制作中
    done:       3  #制作完了
  }
end
