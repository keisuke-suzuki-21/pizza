recipe1 = [1, 3]
recipe2 = [1, 2]
recipe3 = [1, 6]
recipe4 = [1, 5]
recipe5 = [1, 4, 8]
recipe6 = [1, 3, 7]

0.upto(recipe1.length) do |idx|
  RecipeTopping.create(
    recipe_id: 1,
    topping_id: recipe1[idx]
  )
end

0.upto(recipe2.length) do |idx|
  RecipeTopping.create(
    recipe_id: 2,
    topping_id: recipe2[idx]
  )
end

0.upto(recipe3.length) do |idx|
  RecipeTopping.create(
    recipe_id: 3,
    topping_id: recipe3[idx]
  )
end

0.upto(recipe4.length) do |idx|
  RecipeTopping.create(
    recipe_id: 4,
    topping_id: recipe4[idx]
  )
end

0.upto(recipe5.length) do |idx|
  RecipeTopping.create(
    recipe_id: 5,
    topping_id: recipe5[idx]
  )
end

0.upto(recipe6.length) do |idx|
  RecipeTopping.create(
    recipe_id: 6,
    topping_id: recipe6[idx]
  )
end
