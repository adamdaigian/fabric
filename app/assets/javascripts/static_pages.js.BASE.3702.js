$(document).ready(function(){

  $.fn.dontScrollParent = function () {
    return this.bind("mousewheel DOMMouseScroll", function (e) {
      var t;
      return t = e.originalEvent.wheelDelta || -e.originalEvent.detail, t > 0 && $(this).scrollTop() <= 0 ? !1 : t < 0 && $(this).scrollTop() >= this.scrollHeight - $(this).height() ? !1 : !0
    })
  };

  // $('.wrapper').dontScrollParent();

  var renderForm = function(){
    selectedSentence = $(this).attr("id")
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/sentence/" + selectedSentence
    });
  }; // renderForm

  var submitForm = function(){
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

  $("body").on("click", ".sentence", renderForm);
  $("body").on("click", "#submit_annotation", submitForm);

}); // Doc Ready