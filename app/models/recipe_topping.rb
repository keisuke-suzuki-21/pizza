class RecipeTopping < ApplicationRecord
  belongs_to :topping
  belongs_to :recipe
end
