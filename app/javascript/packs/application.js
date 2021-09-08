// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import Sortable from "sortablejs";
const dragula = require("dragula");

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { startTimer } from "../components/timer.js";
import { initFlatpickr } from "../plugins/flatpickr";

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  const buttons = document.querySelectorAll("[data-time]");
  buttons.forEach((button) =>
    button.addEventListener("click", (event) => {
      startTimer(event);
    })
  );
  // const check = document.querySelectorAll('.myCheck');
  // check.forEach(c => {
  //   if (c.checked == true){
  //     task.completed = "completed";
  //   } else {
  //     task.completed = "todo";
  //   }});
  initFlatpickr();
});
import { loadDynamicBannerText } from "../components/banner";

document.addEventListener("turbolinks:load", () => {
  // Call your JS functions here
  // [...]
  const homePageText = document.getElementById("dynamic-text");
  if  (homePageText) {
  loadDynamicBannerText();
  }
});


document.addEventListener("turbolinks:load", () => {
  // Call your JS functions here
  // [...]
  var el = document.getElementById("tasks-list");
  if (el) {
    var sortable = Sortable.create(el, {
    animation:150,
    ghostClass: 'ghost'
  });
}
});

document.addEventListener("turbolinks:load", () => {
  // Call your JS functions here
  // [...]

  var el = document.getElementById("section-container-left");
  if (el) {
    var sortable = Sortable.create(el, {
      ghostClass: "ghost",
      swapThreshold: 0.87,
      animation: 150,
    });
  }
});



// document.addEventListener("turbolinks:load", () => {
//   // Call your JS functions here
//   // [...]
//   const el = [document.getElementById("section-container-left"), document.getElementById("section-container-left")] ;
//   if (el) {
//   dragula(el);
//   }
// });






import "controllers";
