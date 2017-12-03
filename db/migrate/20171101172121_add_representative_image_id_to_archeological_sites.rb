class AddRepresentativeImageIdToArcheologicalSites < ActiveRecord::Migration
  def change
    add_column :archeological_sites, :representative_image_id, :integer
  end
end
