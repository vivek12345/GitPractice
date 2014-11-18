class Project < ActiveRecord::Base
	validates :name,presence: :true
	validates :description,presence: :true
	has_many :tasks
	has_many :assigns
	has_many :subtasks,through: :tasks
	has_many :users,through: :assigns


	after_create :add_tasks

	private

    def add_tasks
        self.tasks.build(taskname: "Production")
        self.tasks.build(taskname: "Development")
        self.tasks.build(taskname: "Test")
    end 

end
