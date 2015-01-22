class ProjectsController < ApplicationController
	before_filter :require_user
	def new
		@projects=current_user.projects
		@project=current_user.projects.new
	end

	def create
		@project=current_user.projects.create(params[:project])
		
	
		respond_to do |format|
		if @project.save
			format.html{redirect_to :projects}
			format.js
	
			flash[:success]="Project created successfully"
		else
			render new
		end
	end

	end

	def show
		@project=Project.find(params[:id])
		
	end

	def index
		@projects=current_user.projects
	end


	

end
