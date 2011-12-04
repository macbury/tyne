require 'spec_helper'

describe SessionsController do
  before :each do
    subject.stub(:require_login).and_return(:foo)
  end

  describe :destroy do
    it "should clear the session" do
      subject.session[:user_id] = :bar

      delete :destroy

      subject.session[:user_id].should be_nil
    end

    it "should redirect to login" do
      delete :destroy

      subject.response.should redirect_to(login_path)
    end
  end

  describe :failure do
    it "should set an information in the flash" do
      subject.should_receive(:flash).and_return({})

      get :failure
    end

    it "should redirect to login path" do
      get :failure

      subject.response.should redirect_to(login_path)
    end
  end

  describe :create do
    before :each do
      @omniauth = {:foo => "bar", "provider" => "provider"}
      subject.request.env["omniauth.auth"] = @omniauth
    end

    context "user is logged in" do
      before :each do
        mock_user = Object.new
        mock_user.stub(:add_provider).and_return(:baz)
        subject.session[:user_id] = :bar
        User.should_receive(:find).with(:bar).and_return(mock_user)
        mock_user.should_receive(:add_provider).with(@omniauth)
      end

      it "should redirect to root" do
        post :create, :provider => "test"

        subject.response.should redirect_to(root_url)
      end
    end

    context "user is logged out" do
      before :each do
        subject.stub(:session).and_return({})
        mock_auth = Object.new
        mock_auth.stub(:user).and_return(Object)
        mock_auth.user.stub(:id).and_return(1)
        Authorization.should_receive(:find_or_create).with(@omniauth).and_return(mock_auth)
      end

      it "should redirect to root" do
        post :create, :provider => "test"

        response.should redirect_to(root_url)
      end
    end
  end
end
