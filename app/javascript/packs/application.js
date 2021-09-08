// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { startTimer } from '../components/timer.js';
import { initFlatpickr } from "../plugins/flatpickr";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  const buttons = document.querySelectorAll('[data-time]');
  buttons.forEach(button => button.addEventListener('click', (event) => {
    startTimer(event);
  }));
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
  loadDynamicBannerText();
});

