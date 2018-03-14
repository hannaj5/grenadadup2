class CreateArchaeologicalSitesCeramicDiagnostics < ActiveRecord::Migration
  def change
    create_table :archaeological_sites_ceramic_diagnostics do |t|
      t.integer :archaeological_site_id
      t.integer :ceramic_diagnostic_id
    end
  end
end
