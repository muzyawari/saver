class TasksController < ApplicationController
  def index
    @user = current_user
    @section = Section.find(params[:section_id])
    @folder = Folder.find(@section.folder_id)
    @q = Task.where(section: @section).ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def new
    @section = Section.find(params[:section_id])
    @task = Task.new
  end

  def create
    @section = Section.find(params[:section_id])
    @folder = Folder.find(@section.folder_id)
    @task = Task.new(task_params)
    @task.section = @section
    if @task.save
      redirect_to folder_path(@folder, anchor: "task-#{@task.id}")
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @section = Section.find(@task.section_id)
    @folder = Folder.find(@section.folder_id)
    @task.destroy
    redirect_to @folder
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @section = Section.find(@task.section_id)
    @folder = Folder.find(@section.folder_id)
    redirect_to @folder
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :date, :completed, :is_event, :position, :section_id)
  end

  def find_task
    @section = Section.find(params[:section_id])
  end
end
