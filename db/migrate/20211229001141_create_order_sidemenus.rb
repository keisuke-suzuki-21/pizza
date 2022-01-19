class CreateOrderSidemenus < ActiveRecord::Migration[5.2]
  def change
    create_table :order_sidemenus do |t|
      t.references :order #, null: false
      t.references :sidemenu #, null: false
      t.integer :number, default: 1
    end
  end
end
