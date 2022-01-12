class Product < ApplicationRecord
  belongs_to :mainmenu
  belongs_to :order, optional: true

  has_many :product_toppings, dependent: :destroy #これによってproductを削除すると関連付けしているtoppingも消える(中間テーブルから)
  has_many :toppings, through: :product_toppings
end
