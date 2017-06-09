class CreateSiteFiles < ActiveRecord::Migration
  def change
    create_table :site_files do |t|

      t.timestamps null: false
    end
  end
end
