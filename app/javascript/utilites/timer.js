document.addEventListener('turbolinks:load', function() {
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
        document.querySelector('form').submit()
      }
    }, 1000)
  }
})
