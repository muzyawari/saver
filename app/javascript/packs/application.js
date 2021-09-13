// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import Sortable from "sortablejs";

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

// import { startTimer } from '../components/timer.js';
import { timer, startTimer } from "../components/timer.js";

import { initFlatpickr } from "../plugins/flatpickr";
import { loadDynamicBannerText } from "../components/banner";
import "chartkick/chart.js";
import Chart from 'chart.js';

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:

  // Date Picker for the Forms
  initFlatpickr();

  // Toggle Calender Views - Monthly & Weekly Calender
  const checkbox = document.querySelector('#toggle');
  const monthly = document.querySelector('.monthly');
  const weekly = document.querySelector('.weekly');
  weekly.style.display = 'none';
  checkbox.addEventListener('change', () => {
    if (checkbox.checked) {
      monthly.style.display = 'none';
      weekly.style.display = 'block';
    } else {
      weekly.style.display = 'none';
      monthly.style.display = 'block';
    }
  });

  // Dynamic Text
  const homePageText = document.getElementById("banner-typed-text");
  if (homePageText) {
    loadDynamicBannerText();
  }

  // Sortable for Tasks
  const el = document.querySelector(".tasks-list");
  if (el) {
    const tasksortable = Sortable.create(el, {
      animation: 150,
      ghostClass: "ghost",
    });
  }


  // Sortable for Widgets
  const sec = document.getElementById("sections-list");
  const sortable = Sortable.create(sec, {
    ghostClass: "ghost",
    swapThreshold: 0.87,
    animation: 150,
  });

  // Timer Default Buttons - 1 Min, 5 Mins, 15 Mins
  const buttons = document.querySelectorAll("[data-time]");
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      startTimer(event);
    })
  });
});

// Timer Entry
const timerentry = document.getElementsByClassName("timer");
if (timerentry && document.customForm) {
  document.customForm.addEventListener("submit", function (e) {
    e.preventDefault();
    const mins = this.minutes.value;
    console.log(mins);
    timer(mins * 60);
    this.reset();
  });
}

import "controllers";
