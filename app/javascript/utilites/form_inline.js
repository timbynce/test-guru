document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (let i = 0; i < controls.length; i++){
      controls[i].addEventListener('click',formInlineLinkHandler)
    }
  }
  
  const errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId){
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  let formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInLine.classList.contains('hide')){
    testTitle.classList.add('hide')
    formInLine.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    testTitle.classList.remove('hide')
    formInLine.classList.add('hide')
    link.textContent = 'Edit'
  }

}
