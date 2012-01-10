# Notifier singleton
Notifier =
  # Displays an error message if errors are defined in the flash
  # Displays a warning message if warnings are defined in the flash
  # Displays a notice message if notices are defined in the flash
  initialize: () ->
    Notifier.showMessage("error", flash_error) if flash_error?
    Notifier.showMessage("warning", flash_warning) if flash_warning?
    Notifier.showMessage("notice", flash_notice) if flash_notice?

  # Dispays the message at the top of the page with a nice animation
  showMessage: (type, message) ->
    $("<div class=\"flash " + type + "\">" + message  + "</div>").appendTo("body")

    $(".flash." + type).css({'position':"absolute"})
      .css({'margin-top': "-100px", top: "0px"})
      .animate({'margin-top': "0px"})
      .delay(5000).animate({'margin-top': "-100px"})

$(document).ready ->
  Notifier.initialize()
