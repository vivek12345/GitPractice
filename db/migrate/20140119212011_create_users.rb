class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,:default => "", :null => false 
      t.string :email,:default => "", :null => false 
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :perishable_token,:default => "", :null => false 
      

      t.timestamps
    end
    add_index :users, :perishable_token  
      add_index :users, :email  
  end
end
