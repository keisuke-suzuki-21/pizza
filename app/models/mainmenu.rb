class Mainmenu < ApplicationRecord
  has_many :products, dependent: :destroy
  
  has_one :recipe
end
