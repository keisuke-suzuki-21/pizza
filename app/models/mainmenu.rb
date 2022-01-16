class Mainmenu < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :recipe

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        from = query.to_i
        to = query.to_i + 200
        rel = rel.where(price: from..to)
      end
      rel
    end
  end
end
