class CreateSidemenus < ActiveRecord::Migration[5.2]
  def change
    create_table :sidemenus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :size
      t.boolean :recommend, null:false
      t.integer :stock, null: false
    end
  end
end
