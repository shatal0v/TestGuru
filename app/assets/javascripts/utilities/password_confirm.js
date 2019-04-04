document.addEventListener('turbolinks:load', function() {
	var confirmation = document.querySelector('.password_confirmation')
	var password = document.querySelector('.password')

	if (confirmation) { confirmation.addEventListener('input', checkConfirmation) }
	if (confirmation) { password.addEventListener('input', checkConfirmation) }
})

function checkConfirmation() {
	var password = document.querySelector('.password')
	var confirmation = document.querySelector('.password_confirmation')

	var check = document.querySelector('.octicon-check')
	var x = document.querySelector('.octicon-x')

	if (confirmation.value == "") {
		check.classList.add('hide')
		x.classList.add('hide')
		return
	}

	if (confirmation.value == password.value) {
		check.classList.remove('hide')
		x.classList.add('hide')
	} else {
		check.classList.add('hide')
		x.classList.remove('hide')
	}

	console.log(confirmation.value == password.value)
}
