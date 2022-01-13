recipe1 = [0, 2]
recipe2 = [0, 1]
recipe3 = [0, 5]
recipe4 = [0, 4]
recipe5 = [0, 3, 7]
recipe6 = [0, 2, 6]

0.upto(recipe1.length) do |idx|
  RecipeTopping.create(
    recipe_id: 1,
    topping_id: recipe1[idx + 1]
  )
end

0.upto(recipe2.length) do |idx|
  RecipeTopping.create(
    recipe_id: 2,
    topping_id: recipe1[idx + 1]
  )
end

0.upto(recipe3.length) do |idx|
  RecipeTopping.create(
    recipe_id: 3,
    topping_id: recipe1[idx + 1]
  )
end

0.upto(recipe4.length) do |idx|
  RecipeTopping.create(
    recipe_id: 4,
    topping_id: recipe1[idx + 1]
  )
end

0.upto(recipe5.length) do |idx|
  RecipeTopping.create(
    recipe_id: 5,
    topping_id: recipe1[idx + 1]
  )
end

0.upto(recipe6.length) do |idx|
  RecipeTopping.create(
    recipe_id: 6,
    topping_id: recipe1[idx + 1]
  )
end
