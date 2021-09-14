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
import { timer, startTimer } from "../components/timer.js";

import { initFlatpickr } from "../plugins/flatpickr";
import { loadDynamicBannerText } from "../components/banner";
import "chartkick/chart.js";
import Chart from "chart.js";


// weekly.style.display = "none";
const toggleCalender = (checkbox) => {
  const monthly = document.querySelector(".monthly");
  const weekly = document.querySelector(".weekly");
  if (checkbox && monthly && weekly) {
    const url = new URL(window.location.href);
    if (checkbox.checked) {
      monthly.style.display = "none";
      weekly.style.display = "block";
      url.searchParams.append('week', 'true');
    } else {
      weekly.style.display = "none";
      monthly.style.display = "block";
      url.searchParams.delete('week');
    }
    window.history.pushState("", "", `${url.pathname}${url.search}`);
  }
}

document.addEventListener("turbolinks:load", () => {
  // Date Picker for the Forms
  initFlatpickr();
  // Dynamic Text
  const homePageText = document.getElementById("banner-typed-text");
  if (homePageText) {
    loadDynamicBannerText();
  }

  // Timer Default Buttons - 1 Min, 5 Mins, 15 Mins
  const buttons = document.querySelectorAll("[data-time]");
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      startTimer(event);
    });
  });

  // Toggle Calender Views - Monthly & Weekly Calender
  const checkbox = document.querySelector("#toggle");
  // toggleCalender(checkbox) // for the first run through
  checkbox.addEventListener("change", () => {
    toggleCalender(checkbox);
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
});

// Sortable for Tasks
document.addEventListener("turbolinks:load", () => {
  const el = document.querySelectorAll(".tasks-list");
  el.forEach((list) => {
    const sortable = Sortable.create(list, {
      animation: 150,
      ghostClass: "ghost",
    });
  });
});

// Sortable for Widgets
document.addEventListener("turbolinks:load", () => {
  var el = document.getElementById("sections-list");
  var sortable = Sortable.create(el, {
    ghostClass: "ghost",
    swapThreshold: 0.87,
    animation: 150,
  });
});

import "controllers";
