class CreateArcheologicalSitesThreats < ActiveRecord::Migration
  def change
    create_table :archeological_sites_threats do |t|
      t.integer :archeological_site_id
      t.integer :threat_id
    end
  end
end
