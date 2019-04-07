document.addEventListener('turbolinks:load', function() {
	var progressBar = document.querySelector('.progress-bar')
	
	if (progressBar) { changePercentage }
})

function changePercentage() {
	var progressBar = document.querySelector('.progress-bar')


	var questionPercentage = progressBar.dataset.oneQuestionPercentage
	var currentQuestionNumber = progressBar.dataset.currentQuestionNumber

	progressBar.style.width = '' + currentQuestionNumber * questionPercentage + '%'
}
