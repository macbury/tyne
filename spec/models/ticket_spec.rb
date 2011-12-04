require 'spec_helper'

describe Ticket do
  describe :validations do
    it { should validate_presence_of :title }
    it { should validate_presence_of :ticket_type_id }
    it { should validate_presence_of :project_id }
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
        @ticket.available_transitions.should == { "open" => nil, "work" => :start_working }
      end
    end
  end
end
