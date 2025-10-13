document.addEventListener("turbo:load", () => {
  const timerEl = document.getElementById("timer");
  if (!timerEl) return;

  let timeLeft = parseInt(timerEl.dataset.remaining, 10);
  if (isNaN(timeLeft)) return;

  const display = timerEl.querySelector("#timer-display");
  const form = document.querySelector("form");

  const updateDisplay = () => {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;
    display.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`;
  };

  updateDisplay();

  const interval = setInterval(() => {
    timeLeft -= 1;
    updateDisplay();

    if (timeLeft <= 0) {
      clearInterval(interval);
      form.submit();
    }
  }, 1000);
});
