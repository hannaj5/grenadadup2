class CreateArchaeologicalSitesThreats < ActiveRecord::Migration
  def change
    create_table :archaeological_sites_threats do |t|
      t.integer :archaeological_site_id
      t.integer :threat_id
    end
  end
end
