class Subtask < ActiveRecord::Base
	belongs_to :task
	has_many :projects,through: :tasks
	has_many :subtask_users
	has_many :users,through: :subtask_users

end
