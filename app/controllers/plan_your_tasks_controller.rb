class PlanYourTasksController < ApplicationController
	def index
		if current_user
			redirect_to projects_url
		end
		
		
	end

	def help
	end
	
end
