class Product < ApplicationRecord
  belongs_to :mainmenu

  has_many :product_toppings
  has_many :toppings, through: :product_toppings

  belongs_to :order
end
