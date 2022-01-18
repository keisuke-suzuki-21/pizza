class Topping < ApplicationRecord
  has_many :recipe_toppings
  has_many :recipes, through: :recipe_toppings
  has_many :product_toppings
  has_many :products, through: :product_toppings

  validates :name, presence: true, uniqueness: true
end
