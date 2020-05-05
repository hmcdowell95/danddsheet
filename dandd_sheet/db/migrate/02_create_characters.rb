class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |x|
      x.string :class_name
      x.string :name 
      x.integer :strength
      x.integer :dexterity
      x.integer :constitution
      x.integer :intelligence
      x.integer :wisdom
      x.integer :charisma
      x.string :info
    end
  end
end