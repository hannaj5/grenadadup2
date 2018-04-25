class CreateArchaeologicalSitesPreviousWorks < ActiveRecord::Migration
  def change
    create_table :archaeological_sites_previous_works do |t|
      t.integer :archaeological_site_id
      t.integer :previous_work_id
    end
  end
end
