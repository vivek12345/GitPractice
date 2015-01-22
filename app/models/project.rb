class Project < ActiveRecord::Base
	extend FriendlyId

	friendly_id :name, use: :slugged
	validates :name,presence: :true
	validates :description,presence: :true
	has_many :tasks,dependent: :destroy
	has_many :assigns,dependent: :destroy
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
