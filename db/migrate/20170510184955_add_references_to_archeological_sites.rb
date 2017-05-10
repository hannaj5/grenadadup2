class AddReferencesToArcheologicalSites < ActiveRecord::Migration
  def change
    add_column :archeological_sites, :references, :text
  end
end
