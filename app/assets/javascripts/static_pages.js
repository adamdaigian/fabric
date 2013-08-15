$(document).ready(function(){
  $("#annotate_window").hide();



  // $('.wrapper').dontScrollParent();

  var renderForm = function(){
    console.log("renderForm");
    selectedSentence = $(this).attr("id");
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/sentence/" + selectedSentence
    });
  }; // renderForm

  var submitForm = function(){
    console.log("submitForm")
    sentence_id = $('#sentence_id').val();
    console.log("sentence_id is " + sentence_id);
    annotation_content = $("#annotation_field").val();
    console.log("annotation_content is " + annotation_content)
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/addAnnotation/" + selectedSentence + "/" +  annotation_content //create custom route
    });
  }; // submitForm

  // Event Handlers
  $("body").on("click", ".sentence", renderForm);
  $("body").on("click", "#submit_annotation", submitForm);

}); // Doc Ready