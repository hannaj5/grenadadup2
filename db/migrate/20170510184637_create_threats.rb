class CreateThreats < ActiveRecord::Migration
  def change
    create_table :threats do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
