class Sidemenu < ApplicationRecord
  has_many :order_sidemenus
  has_many :orders, through: :order_sidemenus

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        from = query.to_i
        to = query.to_i + 100
        rel = rel.where(price: from..to)
      end
      rel
    end
  end

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
