# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be
# available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      ## Database authenticatable
      t.change :email, :string,     :null => false, :default => "" 

    end

    #add_index :users, :email,                unique: true
   # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end