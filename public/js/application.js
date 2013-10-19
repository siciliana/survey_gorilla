$(document).ready(function() {
  $("#button_add_question").on('click', function(event) {
    event.preventDefault();
    var url = '/get_add_question_partial'
    $.get(url, function(response) {
      $('#add_question').append(response)
    });
  });
});
