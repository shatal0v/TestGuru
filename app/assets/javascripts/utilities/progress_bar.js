document.addEventListener('turbolinks:load', function() {
	var progressBar = document.querySelector('.progress-bar')
	var nextButton = document.querySelector('.next-button')
	

	if (progressBar) {
		//if (!progressBar.style.width) {
		//	progressBar.style.width = '' + progressBar.dataset.oneQuestionPercentage + '%'
		//}
		nextButton.addEventListener('click', changePercentage)
	}
})

function changePercentage() {
	var progressBar = document.querySelector('.progress-bar')
	var nextButton = document.querySelector('.next-button')
	var questionPercentage = progressBar.dataset.oneQuestionPercentage
	var currentQuestionNumber = nextButton.dataset.currentQuestionNumber

	progressBar.style.width = '' + currentQuestionNumber * questionPercentage + '%'
}
