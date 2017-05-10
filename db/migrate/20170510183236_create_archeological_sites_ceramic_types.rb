class CreateArcheologicalSitesCeramicTypes < ActiveRecord::Migration
  def change
    create_table :archeological_sites_ceramic_types do |t|
      t.integer :archeological_site_id
      t.integer :ceramic_type_id
    end
  end
end
