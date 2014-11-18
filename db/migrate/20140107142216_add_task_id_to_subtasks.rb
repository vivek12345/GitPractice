class AddTaskIdToSubtasks < ActiveRecord::Migration
  def change
  	add_column :subtasks,:task_id,:integer
  end
end
