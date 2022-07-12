document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-bar')

  if (progressBar){
    let questionsCount = progressBar.dataset.questionsCount
    let currentQuestion = progressBar.dataset.currentQuestion
  
    progressBar.style.width = currentProgress(currentQuestion, questionsCount) + '%'
    progressBar.ariaValueNow = currentProgress(currentQuestion, questionsCount)
  }
})

function currentProgress(currentQuestion, questionsCount){
  return (parseFloat(currentQuestion) / parseFloat(questionsCount) * 100).toString()
}
