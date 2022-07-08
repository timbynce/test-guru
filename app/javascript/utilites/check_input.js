$(document).on('turbolinks:load', function() {
  var control = document.querySelector('.check-pass-input')
  
  if (control) { $(control).on('input', checkPassInput) }
})

function checkPassInput(){
  var form_pass = document.querySelector('[name="user[password]"]').value
  var form_confirm = document.querySelector('[name="user[password_confirmation]').value

  if (form_pass == form_confirm) { 
    this.querySelector('.octicon-check-circle-fill').classList.remove('hide') 
    this.querySelector('.octicon-x-circle-fill').classList.add('hide')  
  } else if(form_confirm !== ''){
    this.querySelector('.octicon-check-circle-fill').classList.add('hide') 
    this.querySelector('.octicon-x-circle-fill').classList.remove('hide')
  } else {
    this.querySelector('.octicon-check-circle-fill').classList.add('hide') 
    this.querySelector('.octicon-x-circle-fill').classList.add('hide') 
  }
}
