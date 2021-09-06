class TasksController < ApplicationController
  before_action :find_task, only: [:update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
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
  end
end
