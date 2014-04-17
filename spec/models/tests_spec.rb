require 'spec_helper'
require 'test'

describe(Test) do
  it { should validate_presence_of :name }
end
