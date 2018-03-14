class CreateActiveAdminComments < ActiveRecord::Migration
<<<<<<< HEAD
  #drop_table(:active_admin_comments, if_exists: true)
=======
  # drop_table(:active_admin_comments, if_exists: true)
>>>>>>> 1c186e70eb4ae1a29555d7eddaff36fa5177ea11
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text   :body
      t.references :resource, polymorphic: true
      t.references :author, polymorphic: true
      t.timestamps null: false
    end
    add_index :active_admin_comments, [:namespace]

    add_index :active_admin_comments, %i[author_type author_id]
    add_index :active_admin_comments, %i[resource_type resource_id]
  end

  def self.down
    drop_table :active_admin_comments
  end
end
