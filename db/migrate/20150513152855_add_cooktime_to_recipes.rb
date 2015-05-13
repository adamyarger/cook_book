class AddCooktimeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cooktime, :integer, default: 0
  end
end
