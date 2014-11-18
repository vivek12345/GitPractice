class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.integer :project_id
      t.integer :subtask_id

      t.timestamps
    end
  end
end
