document.addEventListener('turbolinks:load', function() {
  let submitButton  = document.querySelector('btn btn-primary mt-1')

  let timer = document.querySelector('.caption')
  if (timer){
    let deadline = new Date(timer.dataset.deadline * 1000)
    let testId = timer.dataset.testId
    setInterval(function() { 
      let now = Date.now()

      if (now < deadline){
        timer.innerHTML = 'Осталось ' + Math.ceil((deadline - now)/1000) + ' секунд'
      }
      else{
        let link= "https://testgurutimbynce.herokuapp.com/test_passages/" + testId + "/result"
        window.location.href = link
      }
    }, 1000)
  }
})
