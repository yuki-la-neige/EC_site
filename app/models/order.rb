class Order < ApplicationRecord
  has_many :order_items
  belongs_to :end_user, -> {with_deleted}

  enum status:{
    waiting:      0, #入金待ち
    confirmation: 1, #入金確認
    producing:    3, #制作中
    preparation:  4, #発送準備中
    done:         5  #発送済み
  }
  enum payment_method:{
    "クレジットカード":         0, #クレジットカード
    "銀行振込":         1  #
  }
end
