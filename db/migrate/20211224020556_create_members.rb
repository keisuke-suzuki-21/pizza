class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false
      # t.string :password, null: false
      t.string :adress, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.integer :point
      t.string :fullname, null:false
    end
  end
end
