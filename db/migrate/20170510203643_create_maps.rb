class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :file
      t.integer :archeological_site_id

      t.timestamps null: false
    end
  end
end
