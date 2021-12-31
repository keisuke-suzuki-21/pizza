class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      # t.references :mainmenu, null: false
      # t.references :topping, null: false
      t.string :name, null: false
    end
  end
end
