require 'spec_helper'

describe Ticket do
  describe :validations do
    it { should validate_presence_of :title }
    it { should validate_presence_of :ticket_type_id }
    it { should validate_presence_of :project_id }

    it { should have_many :comments }
  end

  describe :available_transitions do
    context "for a new ticket" do
      it "should return the current state without an action" do
        Ticket.new.available_transitions.should == { "open" => nil }
      end
    end

    context "for an existing ticket" do
      before :each do
        @ticket = Ticket.new({ :title => "Lorem" })
        @ticket.stub(:new_record?).and_return(false)
      end

      it "should return the current state and the available states" do
        @ticket.available_transitions.should == { "open" => nil, "work" => :start_working, "invalid" => :task_is_invalid }
      end
    end
  end

  describe :states do
    before :each do
      ticket_type = TicketType.create({ :name => "type" })
      project = Project.create({ :abbreviation => "f", :name => "foo" })
      @ticket = Ticket.create({ :title => "foo", :ticket_type_id => ticket_type.id, :project_id => project.id })
    end

    it "should be completed if state is done" do
      @ticket.completed?.should be_false

      @ticket.start_working
      @ticket.completed?.should be_false

      @ticket.work_completed
      @ticket.completed?.should be_false

      @ticket.review_successfull
      @ticket.completed?.should be_false

      @ticket.task_is_done
      @ticket.completed?.should be_true
    end

    it "should be completed if state is invalid" do

      @ticket.task_is_invalid

      @ticket.completed?.should be_true
    end
  end
end
