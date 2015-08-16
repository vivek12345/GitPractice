class AddCompleteToSubtasks < ActiveRecord::Migration
  def change
  	add_column :subtasks,:complete,:boolean,:default => false
  end
end
