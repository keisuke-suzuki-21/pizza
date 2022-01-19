class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :mainmenu
      t.references :order
      t.integer :price
      t.integer :size, default: 1 #0 = S, 1 = M, 2 = L
      t.integer :number, default: 1 #個数を表すカラム
    end
  end
end
