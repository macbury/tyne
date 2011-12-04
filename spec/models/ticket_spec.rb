require 'spec_helper'

describe Ticket do
  describe :validations do
    it { should validate_presence_of :title }
    it { should validate_presence_of :ticket_type }
  end
end
