class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.time :time
      t.references :user, index: true
      t.integer :servings
      t.text :directions

      t.timestamps null: false
    end
    add_index :recipes, [:user_id, :created_at]
  end
end
