class AddReferencesToArchaeologicalSites < ActiveRecord::Migration
  def change
    add_column :archaeological_sites, :references, :text
  end
end
