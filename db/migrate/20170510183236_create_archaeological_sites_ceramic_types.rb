class CreateArchaeologicalSitesCeramicTypes < ActiveRecord::Migration
  def change
    create_table :archaeological_sites_ceramic_types do |t|
      t.integer :archaeological_site_id
      t.integer :ceramic_type_id
    end
  end
end
