require 'spec_helper'

describe TicketsHelper do
  describe :due_tag do
    it "should return a span tag with the date" do
      helper.due_tag(Date.new(2011, 1, 1)).should == "<span class=\"tag\" title=\"Fixit: 2011-01-01\">2011-01-01</span>"
    end

    context "due date is today" do
      it "should add a today class" do
        helper.due_tag(Date.today).should == "<span class=\"tag today\" title=\"Fixit: 2011-12-04\">today</span>"
      end
    end
  end

  describe :type_tag do
    it "should return a span tag with the ticket type" do
      type = TicketType.new(:name => "foo")
      helper.type_tag(type).should == "<span class=\"tag foo\" title=\"Type: foo\">foo</span>"
    end
  end
end
