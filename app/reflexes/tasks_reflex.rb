# frozen_string_literal: true

class TasksReflex < ApplicationReflex
  def sort
    tasks = JSON.parse(element.dataset.tasks)
    tasks.each do |task|
      task_record = Task.find(task["task"])
      task_record.update(position: task["position"])
    end
  end
end
