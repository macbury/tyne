require 'spec_helper'

describe Authorization do
  it { should belong_to :user }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }

  describe :find_or_create do
    context "there is already an authorization" do
      before :each do
        subject.class.stub(:find_by_provider_and_uid).and_return(:foo)
      end

      it "should return the auth object" do
        subject.class.find_or_create({}).should == :foo
      end
    end

    context "there is no authorization object" do
      it "should create a new user and a new auth object" do
        auth_hash = { "provider" => "p", "uid" => "uid", "info" => { "name" => "name", "email" => "email" }}

        User.should_receive(:create).and_return(:foo)
        subject.class.should_receive(:create).and_return(:bar)

        subject.class.find_or_create(auth_hash).should == :bar
      end
    end
  end
end
