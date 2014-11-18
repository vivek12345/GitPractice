class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
