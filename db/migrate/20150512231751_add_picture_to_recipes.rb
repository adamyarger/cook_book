class AddPictureToRecipes < ActiveRecord::Migration
  def self.up
  	add_attachment :recipes, :picture
  end

  def self.down
  	remove_attachment :recipes, :picture
  end
end
