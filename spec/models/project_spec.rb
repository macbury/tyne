require 'spec_helper'

describe Project do
  it { should validate_presence_of :abbreviation }
  it { should validate_presence_of :name }
end
