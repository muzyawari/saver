let countdown;

const timer = (seconds) => {
  // clear any existing timers
  clearInterval(countdown);
  const now = Date.now();
  const then = now + seconds * 1000;
  displayTimeLeft(seconds);
  // displayEndTime(then);

  countdown = setInterval(() => {
    const secondsLeft = Math.round((then - Date.now()) / 1000);
    // check if we should stop it!
    if(secondsLeft < 0) {
      clearInterval(countdown);
      return;
    }
    // display it
    displayTimeLeft(secondsLeft);
  }, 1000);
}

const displayTimeLeft = (seconds) => {
  const minutes = Math.floor(seconds / 60);
  const remainderSeconds = seconds % 60;
  const display = `${minutes}:${remainderSeconds < 10 ? '0' : '' }${remainderSeconds}`;
  document.title = display;
  const timerDisplay = document.querySelector(".display__time-left");
  timerDisplay.textContent = display;
}

const startTimer = (event) => {
  const button = event.currentTarget
  const time = button.dataset.time
  const seconds = parseInt(time);
  timer(seconds);
}

export { timer, startTimer };
