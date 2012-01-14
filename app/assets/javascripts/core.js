$(document).ready(function () {
  $("body").click(function () {
    $(".dropdown").toggle(false);
    $(".user-link").removeClass("dropped-down");
  });

  $('#user-popup').click(function (event) {
    event.stopPropagation();
  });
});

function popup() {
  $(".dropdown").toggle();

  $(".user-link").toggleClass("dropped-down");
}
