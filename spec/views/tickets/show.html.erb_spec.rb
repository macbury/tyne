require 'spec_helper'

describe "tickets/show.html.erb" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :title => "Title",
      :description => "MyText"
    ))
    @comment = assign(:comment, stub_model(Comment))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
