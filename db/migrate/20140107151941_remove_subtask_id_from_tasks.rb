class RemoveSubtaskIdFromTasks < ActiveRecord::Migration
  def up
  	remove_column :tasks,:subtask_id
  end

  def down
  	add_column :tasks,:subtask_id,:integer
  end
end
