document.addEventListener("turbo:load", () => {
  const timerElement = document.getElementById("timer")
  if (!timerElement) return

  let timeLeft = parseInt(timerElement.dataset.remaining, 10)
  if (isNaN(timeLeft)) return

  const display = timerElement.querySelector("#timer-display")
  const testPassageId = timerElement.dataset.testId

  const updateDisplay = () => {
    const minutes = Math.floor(timeLeft / 60)
    const seconds = timeLeft % 60
    display.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`
  }

  updateDisplay()

  const interval = setInterval(() => {
    timeLeft -= 1
    updateDisplay()

    if (timeLeft <= 0) {
      clearInterval(interval)
      handleTimeout()
    }
  }, 1000)

  const handleTimeout = async () => {
    try {
      await fetch(`/test_passages/${testPassageId}/timeout`, {
        method: "PATCH",
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        }
      })
      window.location.href = `/test_passages/${testPassageId}/result`
    } catch (e) {
      console.error("Ошибка при завершении теста:", e)
      window.location.reload()
    }
  }
})
