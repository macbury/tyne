var Notifier = {
  initialize: function() {
    if (typeof flash_error != 'undefined') Notifier.showMessage("error", flash_error);
    if (typeof flash_warning != 'undefined') Notifier.showMessage("warning", flash_warning);
    if (typeof flash_notice != 'undefined') Notifier.showMessage("notice", flash_notice);
  },
  showMessage: function(type, message) {
    $("<div class=\"flash " + type + "\">" + message  + "</div>").appendTo("body");

    $(".flash." + type).css({'position':"absolute"})
      .css({'margin-top': "-100px", top: "0px"})
      .animate({'margin-top': "0px"})
      .delay(5000).animate({'margin-top': "-100px"});
  }
}
