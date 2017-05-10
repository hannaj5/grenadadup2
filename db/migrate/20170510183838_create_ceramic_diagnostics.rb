class CreateCeramicDiagnostics < ActiveRecord::Migration
  def change
    create_table :ceramic_diagnostics do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
