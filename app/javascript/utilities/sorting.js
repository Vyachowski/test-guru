document.addEventListener('turbo:load', function() {
  const control = document.querySelector('#test-table-sort')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle(event) {
  const control = event.currentTarget
  const tbody = document.querySelector('#user-tests-rows')
  const rows = Array.from(tbody.querySelectorAll('tr'))

  const sortedRows = rows.slice()

  if (control.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    control.querySelector('.octicon-arrow-up').classList.remove('hide')
    control.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    control.querySelector('.octicon-arrow-down').classList.remove('hide')
    control.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  tbody.replaceChildren()
  sortedRows.forEach(row => tbody.appendChild(row))
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent.trim()
  const testTitle2 = row2.querySelector('td').textContent.trim()

  return testTitle1.localeCompare(testTitle2)
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent.trim()
  const testTitle2 = row2.querySelector('td').textContent.trim()

  return testTitle2.localeCompare(testTitle1)
}
