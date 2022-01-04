class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :password_digest, null: false
      t.string :name, null: false
    end
  end
end
