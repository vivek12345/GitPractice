class RemovePerishableTokenFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :perishable_token
  end

  def down
  	add_column :users, :perishable_token, :string, :default => "", :null => false
  end
end
