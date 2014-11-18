class SubtaskUser < ActiveRecord::Base
	belongs_to :subtask
	belongs_to :user
end
