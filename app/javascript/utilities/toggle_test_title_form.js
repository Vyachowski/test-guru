document.addEventListener('turbo:load', () => {
  document.querySelectorAll('tr').forEach(row => {

    const entityId = row.dataset.testId || row.dataset.badgeId
    if (!entityId) return

    const editButton = row.querySelector('.edit-button')
    const titleSpan = row.querySelector(`[data-test-id="${entityId}"], [data-badge-id="${entityId}"]`)
    const form = row.querySelector(`form[data-test-id="${entityId}"], form[data-badge-id="${entityId}"]`)
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
