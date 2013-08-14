$(document).ready(function(){

  var renderForm = function(){
    console.log("called renderForm function")
    selectedSentence = $(this).attr("id")
    console.log("Clicked sentence" + selectedSentence)
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/sentence/" + selectedSentence  //create custom route
    });
  }; // renderForm

  var submitForm = function(){
    sentence_id = $('#sentence_id').val();

  }; // submitForm

  $("body").on("click", ".sentence", renderForm);
  $("body").on("click", "#submit_annotation", renderForm);

}); // Doc Ready