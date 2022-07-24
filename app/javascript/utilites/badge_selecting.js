document.addEventListener('turbolinks:load', function() {
  const selectedOption = document.querySelector('[name="badge[badge_type]')
  if (selectedOption){
    disableRows()
    selectedOption.addEventListener('change',function(){
    disableRows()    
    let str = '[name="badge[' + selectedOption.value + ']"]'
    document.querySelector(str).disabled = false
  }) }
})


function disableRows(){
  let options = document.querySelectorAll(".badge-options")
  document.querySelector('[name="badge[by_category]').disabled = true
  options.forEach((option) => { option.disabled = true })
}
