class CreateArcheologicalSitesCeramicDiagnostics < ActiveRecord::Migration
  def change
    create_table :archeological_sites_ceramic_diagnostics do |t|
      t.integer :archeological_site_id
      t.integer :ceramic_diagnostic_id
    end
  end
end
