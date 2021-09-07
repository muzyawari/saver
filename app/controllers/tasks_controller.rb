class TasksController < ApplicationController
  before_action :find_task, only: [:create, :destroy]

  def index
    @section = Section.find(params[:section_id])
    @tasks = Task.where(section: @section)
  end

  def new
    @task = Task.new
    @section = Section.find(params[:section_id])
  end

  def create
    @section = Section.find(params[:section_id])
    @task = Task.new(task_params)
    @task.section = @section
    if @task.save
      redirect_to folders_path(@task)
    else
      render :new
    end

  end

  def destroy
    @task.destroy
    redirect_to root_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :date, :completed, :is_event, :position, :section_id)
  end

  def find_task
    @section = Section.find(params[:section_id])
  end
end
