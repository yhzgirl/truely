// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function isLoggedIn() {
  return ($('#user-id').length > 0);
}

$(function() {
  $(document).on('click', "#start_new_game, .next-question", function(e) {
    e.preventDefault();
    $('.alert').alert('close');
    // start our Ajax here to load questions/new which renders a new question form
    if (isLoggedIn()) {
      $("#main-page").load("/responses/new");
    } else {
      // simulate the flash message
      var close_btn = '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove-sign"></i></button>'
      $('.row-fluid').prepend('<div class="alert alert-error fade in ">' + close_btn + 'You need to be logged in to play</div>');
    }
  });


  $(document).on('click', "#fiction, #fact", function(e) {
    e.preventDefault();
    var response = $(this).val();
    console.log(response);
    var question_id = $('input[name="response[question_id]"]').val();
    $.post('/responses',
          {response: {question_id: question_id}, commit: response }, 'json'
          )
    .success( function(data) {
      console.log(data);
      $("#main-page").html(data);
    });
  });
});