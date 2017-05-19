class AddWidthHeightDescriptionToMap < ActiveRecord::Migration
  def change
    add_column :maps, :width, :integer
    add_column :maps, :height, :integer
    add_column :maps, :description, :text
    
    add_index :maps, :description
  end
end
