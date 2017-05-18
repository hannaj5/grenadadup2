class ChangeFileToMapInMap < ActiveRecord::Migration
  def change
    rename_column :maps, :file, :map
  end
end
