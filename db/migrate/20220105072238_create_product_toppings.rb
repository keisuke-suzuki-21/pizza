class CreateProductToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :product_toppings do |t|
      t.references :product, null: false
      t.references :topping, null: false 
    end
  end
end
