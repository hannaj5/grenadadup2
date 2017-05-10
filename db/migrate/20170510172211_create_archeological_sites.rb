class CreateArcheologicalSites < ActiveRecord::Migration
  def change
    create_table :archeological_sites do |t|
      t.string :site_number
      t.string :site_name
      t.string :parish
      t.float :latitude
      t.float :longitude
      t.text :location_description
      t.text :recommendations
      t.text :summary
      t.text :notes

      t.timestamps null: false
    end
    
    add_index :archeological_sites, :site_number
    add_index :archeological_sites, :site_name
    add_index :archeological_sites, :parish
    add_index :archeological_sites, :location_description 
    add_index :archeological_sites, :recommendations
    add_index :archeological_sites, :summary
    add_index :archeological_sites, :notes
  end
end
