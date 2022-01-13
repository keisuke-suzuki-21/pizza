class Topping < ApplicationRecord
  # belongs_to :mainmenu, optional:true
  has_many :recipe_toppings
  has_many :recipes, through: :recipe_toppings

  has_many :product_toppings
  has_many :products, through: :product_toppings
end
