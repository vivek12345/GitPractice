class ProjectsController < ApplicationController
	before_filter :require_user
	def new
		@projects=current_user.projects
		@project=current_user.projects.new
	end

	def create
		@project=current_user.projects.create(params[:project])
		#binding.pry

		respond_to do |format|
			if @project.save
				@projects=current_user.projects
				format.js
				#format.html{redirect_to current_user.projects}
				
			#redirect_to current_user.projects
				flash[:success]="Project created successfully"
			else
				render new
				flash[:success]="Project created successfully NOt"
			end
		end	
	end

	def show
		@project=Project.find(params[:id])

	end

	def index
		@projects=current_user.projects
	end

	def destroy
		@project=Project.find(params[:project][:project_id])
		@project.destroy
	end

end
