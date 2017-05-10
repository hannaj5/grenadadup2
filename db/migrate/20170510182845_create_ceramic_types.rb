class CreateCeramicTypes < ActiveRecord::Migration
  def change
    create_table :ceramic_types do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :ceramic_types, :name
  end
end
