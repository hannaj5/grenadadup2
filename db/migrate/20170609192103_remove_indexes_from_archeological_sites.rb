class RemoveIndexesFromArcheologicalSites < ActiveRecord::Migration
  def change
    remove_index :archeological_sites, name: "index_archeological_sites_on_location_description"
    remove_index :archeological_sites, name: "index_archeological_sites_on_notes"
    remove_index :archeological_sites, name: "index_archeological_sites_on_recommendations"
    remove_index :archeological_sites, name: "index_archeological_sites_on_summary"
  end
end

