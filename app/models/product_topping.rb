class ProductTopping < ApplicationRecord
  belongs_to :topping
  belongs_to :product
end
