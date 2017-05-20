class AddDescriptionToCeramicDiagnostics < ActiveRecord::Migration
  def change
    add_column :ceramic_diagnostics, :description, :text
    
    add_index :ceramic_diagnostics, :description
  end
end
