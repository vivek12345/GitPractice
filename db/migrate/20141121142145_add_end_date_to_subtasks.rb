class AddEndDateToSubtasks < ActiveRecord::Migration
  def change
    add_column :subtasks, :end_date, :string
  end
end
