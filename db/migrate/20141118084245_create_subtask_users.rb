class CreateSubtaskUsers < ActiveRecord::Migration
  def change
    create_table :subtask_users,id:false do |t|

      t.integer :user_id
      t.integer :subtask_id
      t.timestamps
    end
    add_index(:subtask_users, [:user_id, :subtask_id], unique: true)
  end
end
