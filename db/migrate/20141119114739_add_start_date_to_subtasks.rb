class AddStartDateToSubtasks < ActiveRecord::Migration
  def change
  	add_column :subtasks, :start_date, :string
  end
end
