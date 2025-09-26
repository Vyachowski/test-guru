document.addEventListener("turbo:load", () => {
  const bar = document.getElementById("test-passage-progress-bar")

  if (!bar) return

  const total = parseInt(bar.dataset.total, 10) || 1
  let current = parseInt(bar.dataset.current, 10) || 0

  current = Math.max(current - 1, 0)
  const percent = Math.floor((current / total) * 100)

  bar.style.width = `${percent}%`
  bar.setAttribute("aria-valuenow", percent)
})
