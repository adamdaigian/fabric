$(document).ready(function(){
  $("#annotate_window").hide();

  // $('.wrapper').dontScrollParent();

  var renderForm = function(){
    selectedSentence = $(this).attr("id");
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/sentence/" + selectedSentence
    });
  }; // renderForm

  var submitForm = function(){
    sentence_id = $('#sentence_id').val();
    annotation_content = $("#annotation_field").val();
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/addAnnotation/" + selectedSentence + "/" +  annotation_content //create custom route
    });
  }; // submitForm

  // Event Handlers

  var removeModal = function(){
    $('#annotate_window').hide()
  };

  $('body').on('click', '.icon-remove', removeModal);
  // $('.icon-remove').click(function() {

  // });


  $("body").on("click", ".sentence", renderForm);
  $("body").on("click", "#submit_annotation", submitForm);

}); // Doc Ready