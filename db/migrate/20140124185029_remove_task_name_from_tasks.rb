class RemoveTaskNameFromTasks < ActiveRecord::Migration
  def up
  	remove_column :tasks,:taskname
  end

  def down
  	add_column :tasks,:taskname,:string
  end
end
