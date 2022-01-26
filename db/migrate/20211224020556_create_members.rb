class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name #, null: false
      t.string :address #, null: false
      t.string :phone #, null: false
      t.string :email #, null: false
      t.integer :point,  default: 1000
      t.string :fullname #, null:false
    end
  end
end
