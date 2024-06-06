document.addEventListener("turbolinks:load", function() {
  var password = document.querySelector("#user_password");
  var confirmation = document.querySelector("#user_password_confirmation");
  var matchMessage = document.querySelector("#password-match");

  function validatePassword() {
    if (password.value !== confirmation.value) {
      if (confirmation.value === '') {
        matchMessage.textContent = '';
      } else {
        matchMessage.textContent = "パスワードが一致しません。";
        matchMessage.style.color = 'red';
      }
    } else {
      matchMessage.textContent = '';
    }
  }

  password.addEventListener('input', validatePassword);
  confirmation.addEventListener('input', validatePassword);
});
