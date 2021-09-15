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
      url.searchParams.append("week", "true");
    } else {
      weekly.style.display = "none";
      monthly.style.display = "block";
      url.searchParams.delete("week");
    }
    window.history.pushState("", "", `${url.pathname}${url.search}`);
  }
};

document.addEventListener("turbolinks:load", () => {
  // Toggle Calender Views - Monthly & Weekly Calender
  const checkbox = document.querySelector("#toggle");
  // toggleCalender(checkbox) // for the first run through
  if (checkbox) {
    checkbox.addEventListener("change", () => {
      toggleCalender(checkbox);
    });
  }
});

document.addEventListener("turbolinks:load", () => {
  // Date Picker for the Forms
  initFlatpickr();
  // Dynamic Text
  const homePageText = document.getElementById("banner-typed-text");
  if (homePageText) {
    loadDynamicBannerText();
  }

  // const timerentry = document.getElementById("start");
  document.customForm.addEventListener("submit", function (e) {
    e.preventDefault();
    const mins = this.minutes.value;
    console.log(mins);
    timer(mins * 60);
  });
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

function myFunctionLeft() {
  var x = document.getElementById("myDIVleft");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

document.addEventListener("turbolinks:load", () => {
  const clickButton = document.getElementById("clickmeleft");
  clickButton.addEventListener("click", (event) => {
    myFunctionLeft();
  });
});


function myFunctionIndexLeft() {
  var x = document.getElementById("myDIVleft");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

document.addEventListener("turbolinks:load", () => {
  const clickButton = document.getElementById("clickmeindexleft");
  clickButton.addEventListener("click", (event) => {
    myFunctionIndexLeft();
  });
});

function myFunctionRight() {
  var x = document.getElementById("myDIVright");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

document.addEventListener("turbolinks:load", () => {
  const clickButton = document.getElementById("clickmeright");
  clickButton.addEventListener("click", (event) => {
    myFunctionRight();
  });
});

document.addEventListener("turbolinks:load", () => {
  const clickButton = document.getElementById("clickmecenter");
  clickButton.addEventListener("click", (event) => {
    myFunctionLeft();
    myFunctionRight();
  });
});



import "controllers";
