document.addEventListener('turbolinks:load', function() {
  const confirm = document.querySelector('[name="user[password_confirmation]')
  const pass = document.querySelector('[name="user[password]"]')
  
  if (confirm) { confirm.addEventListener('input', checkPassInput) }
  if (pass) { pass.addEventListener('input', checkPassInput) }
})

function checkPassInput(){
  let form_pass = document.querySelector('[name="user[password]"]').value
  let form_confirm = document.querySelector('[name="user[password_confirmation]').value
  let check = document.querySelector('.octicon-check-circle-fill')
  let fail = document.querySelector('.octicon-x-circle-fill')

  if (form_pass == form_confirm) { 
    check.classList.remove('hide') 
    fail.classList.add('hide')  
  } else if(form_confirm !== ''){
    check.classList.add('hide') 
    fail.classList.remove('hide')
  } else {
    check.classList.add('hide') 
    fail.classList.add('hide') 
  }
}
