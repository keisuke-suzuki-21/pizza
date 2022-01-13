class CreateRecipeToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_toppings do |t|
      t.references :recipe, null: false
      t.references :topping, null:false
    end
  end
end
