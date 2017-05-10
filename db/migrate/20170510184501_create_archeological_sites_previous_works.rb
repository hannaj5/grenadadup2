class CreateArcheologicalSitesPreviousWorks < ActiveRecord::Migration
  def change
    create_table :archeological_sites_previous_works do |t|
      t.integer :archeological_site_id
      t.integer :previous_work_id
    end
  end
end
