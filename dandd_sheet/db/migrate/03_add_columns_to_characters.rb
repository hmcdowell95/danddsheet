class AddColumnsToCharacters < ActiveRecord::Migration[5.2]
  def change 
    add_column :characters, :ac, :integer
    add_column :characters, :hit_points, :integer
  end
end