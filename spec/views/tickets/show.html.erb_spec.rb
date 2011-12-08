require 'spec_helper'

describe "tickets/show.html.erb" do
  before(:each) do
    view.stub(:current_user).and_return(Factory(:user))
    @ticket = Factory(:ticket)
    @comment = assign(:comment, stub_model(Comment))
  end

  it "renders attributes in <p>" do
    render

    rendered.should have_selector(".ticket")
  end
end
