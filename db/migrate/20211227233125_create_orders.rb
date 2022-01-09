class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :address
      t.date :time
      t.integer :price
      t.boolean :case, null: false, default: 0 #発送前0、発送済み1の状態
      t.boolean :cart, null: false, default: 0 #カート0、注文表1の状態
      t.string :session

      t.references :member, null: false
    end
  end
end
