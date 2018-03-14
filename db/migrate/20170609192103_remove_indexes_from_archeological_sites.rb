class RemoveIndexesFromArcheologicalSites < ActiveRecord::Migration
  def change
    remove_index :archaeological_sites, name: "index_archaeological_sites_on_location_description"
    remove_index :archaeological_sites, name: "index_archaeological_sites_on_notes"
    remove_index :archaeological_sites, name: "index_archaeological_sites_on_recommendations"
    remove_index :archaeological_sites, name: "index_archaeological_sites_on_summary"
  end
end

