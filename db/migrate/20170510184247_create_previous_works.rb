class CreatePreviousWorks < ActiveRecord::Migration
  def change
    create_table :previous_works do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
