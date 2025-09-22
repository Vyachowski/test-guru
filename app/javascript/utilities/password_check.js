document.addEventListener('turbo:load', () => {
  const passwordField = document.getElementById('user_password')
  const confirmationField = document.getElementById('user_password_confirmation')
  const checkIcon = document.querySelector('#password-match-check')
  const xIcon = document.querySelector('#password-match-x')

  if (!passwordField || !confirmationField || !checkIcon || !xIcon) return

  const updateIcons = () => {
    const pwd = passwordField.value
    const confirm = confirmationField.value

    if (!confirm) {
      checkIcon.classList.add('hide')
      xIcon.classList.add('hide')
      return
    }

    if (pwd === confirm) {
      checkIcon.classList.remove('hide')
      xIcon.classList.add('hide')
    } else {
      checkIcon.classList.add('hide')
      xIcon.classList.remove('hide')
    }
  }

  passwordField.addEventListener('input', updateIcons)
  confirmationField.addEventListener('input', updateIcons)
})
