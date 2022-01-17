class Order < ApplicationRecord
  belongs_to :member
  has_many :order_sidemenus
  has_many :sidemenus, through: :order_sidemenus
  has_many :products

  validates :address, presence: true, allow_nil: true  #, on: :confirm
  validates :time, presence: true, allow_nil: true  #, on: :confirm
end
