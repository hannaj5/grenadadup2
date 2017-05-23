class AddDescriptionToTables < ActiveRecord::Migration
  def change
    add_column :ceramic_types, :description, :text
    add_column :generic_files, :description, :text
    add_column :previous_works, :description, :text
    add_column :threats, :description, :text
    
    add_index :ceramic_diagnostics, :name

    add_index :ceramic_types, :description
    
    add_index :generic_files, :name
    add_index :generic_files, :description
    
    add_index :maps, :name
    
    add_index :previous_works, :name
    add_index :previous_works, :description
    
    add_index :threats, :name
    add_index :threats, :description
  end
end
