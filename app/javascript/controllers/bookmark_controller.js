import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["url", "description", "img", "title"];
  static values = { url: String }

  connect() {
    console.log('bookmark controller')
    this.populateBookmark()
  }

  populateBookmark() {
    fetch(
      `https://v1.nocodeapi.com/muztech/link_preview/unotYETNKpetgFfL?url=${this.urlValue}`
    )
      .then((response) => response.json())
      .then((response) => {
        console.log(response);

        this.titleTarget.innerHTML = response.title;
        this.descriptionTarget.innerHTML = response.description;
        this.imgTarget.src = response.image;
      });
  }
}
