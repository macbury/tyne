require 'spec_helper'

describe "tickets/index.html.erb" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Ticket,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tickets" do
    render

    rendered.should have_selector "div#tickets"
  end
end
