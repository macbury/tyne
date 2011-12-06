describe("Notification", function() {
  var instance;

  beforeEach(function() {
    instance = Notifier;
    delete flash_notice;
    delete flash_warning;
    delete flash_error;
  });

  it("should not display a message if no message is defined", function() {
    spyOn(Notifier, "showMessage");

    Notifier.initialize();

    expect(Notifier.showMessage).not.toHaveBeenCalled();
  });

  it("should display a message if a notice is defined", function() {
    spyOn(Notifier, "showMessage");

    flash_notice = "Foo";

    Notifier.initialize();

    expect(Notifier.showMessage).toHaveBeenCalledWith("notice", "Foo");
  });

  it("should display a message if a warning is defined", function() {
    spyOn(Notifier, "showMessage");

    flash_warning = "Bar";

    Notifier.initialize();

    expect(Notifier.showMessage).toHaveBeenCalledWith("warning", "Bar");
  });

  it("should display a message if a error is defined", function() {
    spyOn(Notifier, "showMessage");

    flash_error = "Baz";

    Notifier.initialize();

    expect(Notifier.showMessage).toHaveBeenCalledWith("error", "Baz");
  });
});
