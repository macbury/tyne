require 'spec_helper'

describe "projects/index.html.erb" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :abbreviation => "Abbreviation",
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Project,
        :abbreviation => "Abbreviation",
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of projects" do
    render

    rendered.should have_selector(".project", :count => 2)
  end
end
