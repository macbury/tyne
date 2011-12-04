require 'spec_helper'

describe "tickets/new.html.erb" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path, :method => "post" do
      assert_select "input#ticket_title", :name => "ticket[title]"
      assert_select "textarea#ticket_description", :name => "ticket[description]"
    end
  end

  context "model has erros" do
    before :each do
      ticket = Ticket.new
      ticket.errors.add(:title, "foo")
      assign(:ticket, ticket)
    end

    it "should display the form with validation errors" do
      render

      rendered.should have_selector "#error_explanation"
      rendered.should have_selector ".field_with_errors"
    end
  end
end
