class AddColumnsToCharacters < ActiveRecord::Migration[5.2]
  def change 
    add_column :characters, :AC, :integer
    add_column :characters, :hit_points, :integer
  end
end