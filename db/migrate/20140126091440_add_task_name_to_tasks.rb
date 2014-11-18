class AddTaskNameToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks,:taskname,:string
  	remove_column :tasks,:user_id
  end
end
