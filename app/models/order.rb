class Order < ApplicationRecord
  belongs_to :member

  has_many :order_sidemenus
  has_many :sidemenus, through: :order_sidemenus
end
