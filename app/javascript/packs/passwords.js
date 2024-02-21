document.addEventListener("turbolinks:load", function() {
  var password = document.querySelector("#user_password");
  var confirmation = document.querySelector("#user_password_confirmation");
  var matchMessage = document.querySelector("#password-match"); // メッセージ表示用の要素を取得

  function validatePassword() {
    if (password.value !== confirmation.value) {
      if (confirmation.value === '') {
        matchMessage.textContent = ''; // 確認パスワードが空の場合はメッセージをクリア
      } else {
        matchMessage.textContent = "パスワードが一致しません。"; // 一致しない場合のメッセージ
        matchMessage.style.color = 'red'; // メッセージの色を変更
      }
    } else {
      matchMessage.textContent = ''; // パスワードが一致する場合はメッセージを表示しない
    }
  }

  password.addEventListener('input', validatePassword);
  confirmation.addEventListener('input', validatePassword);
});
