import ApplicationController from "./application_controller";

/* This is the custom StimulusReflex controller for the Tasks Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ["list"];
  sort(event) {
    let element = this.listTarget;
    let task_elements = element.querySelectorAll(".task-item");
    let tasks = Array.from(task_elements).map((task, index) => {
      return {
        section_id: task.dataset.taskSectionId,
        task: task.dataset.taskId,
        position: index + 1,
      };
    });
    element.dataset.tasks = JSON.stringify(tasks);
    this.stimulate("TasksReflex#sort", element);
  }

  connect() {
    super.connect();
    // add your code here, if applicable
  }
}
