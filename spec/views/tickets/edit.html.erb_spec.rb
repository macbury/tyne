require 'spec_helper'

describe "tickets/edit.html.erb" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "input#ticket_title", :name => "ticket[title]"
      assert_select "textarea#ticket_description", :name => "ticket[description]"
    end
  end
end
