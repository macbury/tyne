require 'spec_helper'

describe ApplicationHelper do
  describe :menu_link do

    it "should use the link_to method to produce the link" do
      helper.should_receive(:link_to).with("foo", "bar", {})

      helper.menu_link("foo", "bar")
    end

    it "should return a link" do
      helper.menu_link("foo", "bar").should == "<a href=\"bar\">foo</a>"
    end

    context "the link url is the current url" do
      before :each do
        helper.stub(:current_page?).and_return(true)
      end

      it "should add class current to the link" do
        helper.menu_link("foo", "bar").should == "<a href=\"bar\" class=\"current\">foo</a>"
      end
    end
  end

  describe :title do
    it "should return the i18n translation for the current page" do
      I18n.backend.store_translations :en, :page => { :info => { :foo_controller => { :bar_action => "test" } } }

      helper.stub(:params).and_return({ :controller => "foo_controller", :action => "bar_action" })

      helper.title.should == "test"
    end
  end

  describe :description do
    it "should return the i18n translation for the current page" do
      I18n.backend.store_translations :en, :page => { :description => { :foo_controller => { :bar_action => "test" } } }

      helper.stub(:params).and_return({ :controller => "foo_controller", :action => "bar_action" })

      helper.description.should == "test"
    end
  end

  describe :trim do
    it "should return the text if the text contains less or equal lines" do
      text = "Lorem\nIpsum"

      helper.trim(text, 3).should == text
    end

    it "should trim the text after x lines" do
      text = "Text\nwith\n\more\nlines"

      helper.trim(text, 3).should == "Text\nwith\nmore..."
    end
  end
end
