class TasksController < ApplicationController

	def new
    @project=Project.find(params[:project_id])
		@task=@project.tasks.build
	end

  def create
    @project=Project.find(params[:project_id])
    @task=@project.tasks.create(params[:task])
    @subtask=@task.subtasks.first
    respond_to do |format|
      if @task.save
        format.html{redirect_to @project}
        format.js
        flash[:success]="Task created successfully"
      else
        render new
      end
    end
  end

    def edit
  	@task=Task.find(params[:id])
    end

    def update
    	@task=Task.find(params[:id])
    	if @task.update_attributes(params[:task])
  		flash.now[:success]="Profile updated successfully"
  	
  		redirect_to root_url
  	    else
  		render 'edit'
  	end

    end
    def destroy
    @task=Task.find(params[:task][:task_id])
    @task.destroy
    end
end
