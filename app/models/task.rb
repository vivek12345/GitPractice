class Task < ActiveRecord::Base
	belongs_to :project
	#belongs_to :users
	has_many :subtasks
	
	
end
