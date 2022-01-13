class Recipe < ApplicationRecord
  has_many :recipe_toppings
  has_many :toppings, through: :recipe_toppings

  belongs_to :mainmenu
end
