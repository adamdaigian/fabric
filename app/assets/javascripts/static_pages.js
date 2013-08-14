$(document).ready(function(){

  $.fn.dontScrollParent = function () {
    return this.bind("mousewheel DOMMouseScroll", function (e) {
      var t;
      return t = e.originalEvent.wheelDelta || -e.originalEvent.detail, t > 0 && $(this).scrollTop() <= 0 ? !1 : t < 0 && $(this).scrollTop() >= this.scrollHeight - $(this).height() ? !1 : !0
    })
  };

  // $('.wrapper').dontScrollParent();

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