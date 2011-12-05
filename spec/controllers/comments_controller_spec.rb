require 'spec_helper'

describe CommentsController do
  def mock_user
    @mock_user ||= User.create( { :name => "name", :email => "email" } )
  end

  def mock_ticket
    @project ||= Project.create({ :abbreviation => "F", :name => "foo" })
    @type ||= TicketType.create({ :name => "foo" })
    @ticket ||= Ticket.create({ :title => "foo", :ticket_type_id => @type.id, :project_id => @project.id})
  end

  before :each do
    subject.stub(:require_login).and_return(:foo)
    subject.session[:user_id] = 1

    User.stub(:find).with(1).and_return(mock_user)
    Ticket.stub(:find).with("1").and_return(mock_ticket)
  end

  describe :create do
    it "should create a new comment" do
      expect do
        post :create, :ticket_id => 1, :comment => { :body => "foo", :ticket_id => 1 }
      end.to change(Comment, :count).by(1)
    end

    it "should redirect to the ticket if request is valid" do
      Comment.stub(:save).and_return(true)

      post :create, :ticket_id => 1, :comment => { :body => "foo", :ticket_id => 1 }

      flash[:notice].should == "Your comment has been saved."
      response.should redirect_to ticket_path(@ticket)
    end

    it "should redirect to the ticket if request is invalid" do
      post :create, :ticket_id => 1, :comment => { :ticket_id => 1 }

      flash[:error].should == "Could not save your comment, sorry..."
      response.should redirect_to ticket_path(@ticket)
    end
  end
end
