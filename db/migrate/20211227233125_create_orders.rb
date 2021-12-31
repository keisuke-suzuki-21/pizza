class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :address, null: false
      t.string :time, null: false
      t.integer :price, null: false
      t.string :case, null: false
      t.boolean :cart, null: false
      t.string :session

      t.references :member, null: false
      t.references :sidemenu
    end
  end
end
