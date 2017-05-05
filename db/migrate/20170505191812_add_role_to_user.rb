class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 1
    
    add_index :users, :role
  end
end
