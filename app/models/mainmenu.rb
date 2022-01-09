class Mainmenu < ApplicationRecord
  # has_many :toppings
  has_many :products, dependent: :destroy
end
