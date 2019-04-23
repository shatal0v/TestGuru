document.addEventListener('turbolinks:load', function() {
	var confirmation = document.querySelector('.timer')

	if (confirmation) { setTimer }
})

function setTimer() {
	var timer = document.querySelector('.timer')
	var min = timer.textContent.parseInt()

	var now = new Date()
	var ending = now.setSeconds(now.getMinutes() + min);
}
