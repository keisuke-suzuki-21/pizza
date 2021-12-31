class Sidemenu < ApplicationRecord
  has_many :order_sidemenus
  has_many :orders, through: :order_sidemenus
end
