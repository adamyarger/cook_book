class ChangeTimeToMinutes < ActiveRecord::Migration
  def up
    change_column :recipes, :time, :time
  end

  def down
    change_column :recipes, :minutes, :integer
  end
end
