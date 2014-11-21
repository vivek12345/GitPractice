ActiveAdmin.register Task do
sidebar "Task Details" do
ul do
        li link_to("Subtasks", admin_task_subtasks_path(Task))
        
     end  
 end
end
