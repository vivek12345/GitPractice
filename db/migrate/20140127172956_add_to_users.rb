class AddToUsers < ActiveRecord::Migration
  def up
  	add_column :users,:firstname,:string
  	add_column :users,:lastname,:string
  end

  def down
  	drop_column :users,:firstname
  	drop_column :users,:lastname
  end
end
