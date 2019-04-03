document.addEventListener('turbolinks:load', function() {
	var confirmation = document.querySelector('.password_confirmation')

	if (confirmation) { confirmation.addEventListener('input', checkConfirmation) }
})

function checkConfirmation() {
	var password = document.querySelector('.password')
	var confirmation = document.querySelector('.password_confirmation')

	var check = document.querySelector('.octicon-check')
	var x = document.querySelector('.octicon-x')

	if (confirmation.value == password.value) {
		check.classList.remove('hide')
		x.classList.add('hide')
	} else if (confirmation.value == "") {
		check.classList.add('hide')
		x.classList.add('hide')
	} else {
		check.classList.add('hide')
		x.classList.remove('hide')
	}

	console.log(confirmation.value == password.value)
}
