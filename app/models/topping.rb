class Topping < ApplicationRecord
  # belongs_to :mainmenu, optional:true

  has_many :product_toppings
  has_many :products, through: :product_toppings
end
