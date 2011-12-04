$(document).ready(function() {
  if (typeof flash_error != 'undefined') {
    flash(flash_error, "error");
  }

  if (typeof flash_warning != 'undefined') {
    flash(flash_warning, "warning");
  }

  if (typeof flash_notice != 'undefined') {
    flash(flash_notice, "notice");
  }
});

function flash(message, type) {
  $("<div class=\"flash " + type + "\">" + message  + "</div>")
  .appendTo("body");

   $(".flash." + type).css({'position':"absolute"})
     .css({'margin-top': "-100px", top: "0px"})
     .animate({'margin-top': "0px"})
     .delay(5000)
     .animate({'margin-top': "-100px"});
}
