class Product < ApplicationRecord
  belongs_to :mainmenu
  belongs_to :order

  has_many :product_toppings
  has_many :toppings, through: :product_toppings
end
