document.addEventListener('turbo:load', () => {
  document.querySelectorAll('tr').forEach(row => {
    const testId = row.dataset.testId

    if (!testId) return

    const editButton = row.querySelector('.edit-button')

    const titleSpan = row.querySelector(`.test-title[data-test-id="${testId}"]`)
    const form = row.querySelector(`form[data-test-id="${testId}"]`)
    const cancelButton = form?.querySelector('.cancel-button')

    if (!editButton || !titleSpan || !form || !cancelButton) return

    form.classList.add('hide')

    editButton.addEventListener('click', () => {
      titleSpan.classList.add('hide')
      form.classList.remove('hide')
    })

    cancelButton.addEventListener('click', () => {
      form.classList.add('hide')
      titleSpan.classList.remove('hide')
    })
  })
})
