require 'spec_helper'

describe User do
  it { should have_many :authorizations }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  describe :add_provider do
    it "should create a new authorization object if it does not exists" do
      Authorization.should_receive(:create)

      subject.add_provider({ "provider" => "provider", "uid" => "uid"})
    end
  end
end
