class Mainmenu < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :recipe

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
