class CreateArchaeologicalSites < ActiveRecord::Migration
  def change
    create_table :archaeological_sites do |t|
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

    add_index :archaeological_sites, :site_number
    add_index :archaeological_sites, :site_name
    add_index :archaeological_sites, :parish
    add_index :archaeological_sites, :location_description
    add_index :archaeological_sites, :recommendations
    add_index :archaeological_sites, :summary
    add_index :archaeological_sites, :notes
  end
end
