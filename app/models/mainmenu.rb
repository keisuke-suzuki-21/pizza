class Mainmenu < ApplicationRecord
  has_many :products, dependent: :destroy
end
