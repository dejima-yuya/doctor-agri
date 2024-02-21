document.addEventListener("turbolinks:load", function() {
  var checkBox = document.getElementById('survey_is_request');
  var messageDiv = document.getElementById('consultant_message');

  checkBox.addEventListener('change', function() {
    if (this.checked) {
      messageDiv.style.display = 'block';
    } else {
      messageDiv.style.display = 'none';
    }
  });
});