// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function isLoggedIn() {
  return ($('#user-id').length > 0);
}

$(function() {
  $(document).on('click', "#add_fact_or_fiction", function(e) {
    e.preventDefault();
    $('.alert').alert('close');
    $('.alert').remove();
    // start our Ajax here to load questions/new which renders a new question form
    if (isLoggedIn()) {
      $("#main-page").load("/questions/new");  
    } else {
      // simulate the flash message
      var close_btn = '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove-sign"></i></button>'
      $('.row-fluid').prepend('<div class="alert alert-error fade in ">' + close_btn + 'You need to be logged in to add a question</div>');
    }
  });

  $(document).on('click', "#btn-add-question", function(e) {
    e.preventDefault();
    $('.alert').alert('close');
    var question = $('#question_statement').val();
    var tf = $('input[name="question[fact_or_fiction]"]:checked').val();
    $.post('/questions',
          {question: {statement: question, fact_or_fiction: tf} }, null, 'json' 
          )
    .success( function(data) {
      $("#main-page").load("/");
      // simulate the flash message
      var close_btn = '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove-sign"></i></button>'
      $('.row-fluid').prepend('<div class="alert alert-success fade in ">' + close_btn + 'Thank you for adding to London Fact or Fiction</div>');
    })
    .fail(function(data) { 
      console.log(data);
      var close_btn = '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove-sign"></i></button>'
      $('.row-fluid').prepend('<div class="alert alert-error fade in ">' + close_btn + 'There was a problem try again</div>');
    }); 
  });
});