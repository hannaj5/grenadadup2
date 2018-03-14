class CreateGenericFiles < ActiveRecord::Migration
  def change
    create_table :generic_files do |t|
      t.string :name
      t.string :file
      t.integer :archaeological_site_id

      t.timestamps null: false
    end
  end
end
