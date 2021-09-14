import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["url", "description", "img", "title"];
  static values = { url: String }

  connect() {
    console.log('bookmark controller')
    this.populateBookmark()
  }
// `https://v1.nocodeapi.com/muz/link_preview/wKhyQpJRfavunFjb?url=${this.urlValue}`
  populateBookmark() {
    fetch()
      .then(response => response.json())
      .then((response) => {
        console.log(response);

        this.titleTarget.innerHTML = response.title
        this.descriptionTarget.innerHTML = response.description
        this.imgTarget.src = response.image

      });
  }
}
