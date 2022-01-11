class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :mainmenu
      t.references :order
      t.integer :price
      # t.integer :number, null: false
    end
  end
end
