class AddFiletoSiteFile < ActiveRecord::Migration
  def change
    add_column :site_files, :file, :string
  end
end
