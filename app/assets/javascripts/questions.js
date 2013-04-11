// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function isLoggedIn() {
  return ($('#user-id').length > 0);
}

$('document').ready(function() {
  $("#new_question").click(function(e) {
    $('.alert').alert('close');
    e.preventDefault();
    // start our Ajax here to load questions/new which renders a new question form
    if (isLoggedIn()) {
      $("#main-page").load("/questions/new");  
    } else {
      // simulate the flash message
      var close_btn = '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove-sign"></i></button>'
      $('.row-fluid').prepend('<div class="alert alert-error fade in ">' + close_btn + 'You need to be logged in to ask a question</div>');
    }
    
  });
});

