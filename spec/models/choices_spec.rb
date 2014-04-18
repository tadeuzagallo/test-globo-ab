require 'choice'

describe(Choice) do
  it { should validate_presence_of :url }
  it { should validate_presence_of :weight }
end
