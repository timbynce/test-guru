document.addEventListener('turbolinks:load', function() {
  const selectedOption = document.querySelector('[name="badge[badge_type]')
  if (selectedOption){
    selectedOption.addEventListener('change',function(){
    if (selectedOption.value  == "mixed"){   
      changeRows(false)
    }
    else{
      let str = '[name*="badge[' + selectedOption.value.replace("by_","") + '"]'
      changeRows(true)
      document.querySelector(str).disabled = false
    }
  }) }
})


function changeRows(val){
  let options = document.querySelectorAll(".badge-options")
  document.querySelector('[name*="badge[category"]').disabled = val
  options.forEach((option) => { option.disabled = val })
}
