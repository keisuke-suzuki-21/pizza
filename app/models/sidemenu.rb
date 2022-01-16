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
end
