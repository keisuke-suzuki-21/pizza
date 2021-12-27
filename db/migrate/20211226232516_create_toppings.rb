class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.string :name, null: false
      t.integer :stock, null: false
      t.integer :price, null: false
    end
  end
end
