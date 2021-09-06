class TasksController < ApplicationController
  before_action :find_task, only: [:create, :destroy]

  def new
    @task = Task.new
    @task.section = Section.find(params[:section_id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    @task.section = @section
    redirect_to task_path(@task)
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
    @task = Task.find(params[:id])
    @section = Section.find(params[:section_id])
  end
end
