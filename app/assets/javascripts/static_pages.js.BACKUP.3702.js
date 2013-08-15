$(document).ready(function(){
  $("#annotate_window").hide();

<<<<<<< HEAD

  // $('.wrapper').dontScrollParent();
=======
  $.fn.dontScrollParent = function () {
    return this.bind("mousewheel DOMMouseScroll", function (e) {
      var t;
      return t = e.originalEvent.wheelDelta || -e.originalEvent.detail, t > 0 && $(this).scrollTop() <= 0 ? !1 : t < 0 && $(this).scrollTop() >= this.scrollHeight - $(this).height() ? !1 : !0
    })
  }; // $('.wrapper').dontScrollParent();
>>>>>>> aug14night

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
    annotation_content = $("#annotation_field").val();
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