require 'spec_helper'

describe "tickets/index.html.erb" do
  before(:each) do
    @project = Project.create( { :abbreviation => "f", :name => "foo" })
    assign(:tickets, [
      stub_model(Ticket,
        :title => "Title",
        :description => "MyText",
        :project_id => @project.id
      ),
      stub_model(Ticket,
        :title => "Title",
        :description => "MyText",
        :project_id => @project.id
      )
    ])
  end

  it "renders a list of tickets" do
    render

    rendered.should have_selector ".tickets"
  end
end
