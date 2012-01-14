require 'spec_helper'

describe UsersController do
  describe :edit do
    context "not logged in" do
      it "should redirect to login" do
        get :edit

        response.should redirect_to login_path
      end
    end

    context "logged in" do
      before :each do
        subject.stub(:current_user).and_return(:bla)
        subject.stub(:require_login).and_return(:foo)
      end

      it "should display the edit view" do
        get :edit

        response.should be_success
      end
    end
  end
end
