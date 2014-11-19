class SubtasksController < ApplicationController
	def new

		@task=Task.find(params[:task_id])
		@project=@task.project
		@subtask=@task.subtasks.build
	end


	def create

		@task=Task.find(params[:task_id])
		@project=@task.project
		@subtask=@task.subtasks.create(params[:subtask])
		respond_to do |format|
			if @subtask.save
				format.html{redirect_to @project}
				format.js

           		flash[:success]="Task created successfully"
           	else
          		render new
	   		end
		end
	end

	def edit
		@subtask=Subtask.find(params[:id])

	end

	def update
		
		@subtask=Subtask.find(params[:id])
		#@task=@subtask.task
		#@subtask.description=params[:subtask][:description]
		respond_to do |format|
			if @subtask.update_attribute(:description,params[:subtask][:description])
				format.html{redirect_to @project}
				format.js
			else
				render new
			end
		end


	end

	def updateDate
		@subtask=Subtask.find(params[:subtasks][:id])
		@subtask.update_attribute(:start_date,params[:subtasks][:start_date])
	end

	def destroy
		@subtask=Subtask.find(params[:subtask][:subtask_id])
		@subtask.destroy
	end

	def query
		users = User.joins(:assigns => :project)
		foundusers=users.where('username like %',:q)
      	respond_to do |format|
      		format.json do
        # Create an array from the search results.
        		results = users.map do |user|
          		# Each element will be a hash containing only the title of the article.
          		# The title key is used by typeahead.js.
         		 { username: user.username,
         		   user_id:  user.id }

       		 end
        	render json: results
      	end
    end

    def createuser
    	subtaskuser=SubtaskUser.create(params[:user])
    	subtaskuser.save
    end
end
	
	
end
