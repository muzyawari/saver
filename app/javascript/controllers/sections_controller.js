import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Sections Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  sort(event) {
    let element = document.getElementById('sections-list')
    let section_elements = document.getElementsByClassName('section-item')
    let sections = Array.from(section_elements).map((section, index) => {

      return {section_type: section.dataset.sectionType, id: section.dataset.sectionId, position: (index + 1)}
    })
    element.dataset.sections=JSON.stringify(sections)
    this.stimulate('SectionsReflex#sort', element)
  }
  connect () {
    super.connect()
    // add your code here, if applicable
  }
}
