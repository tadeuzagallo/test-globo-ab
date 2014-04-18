require 'choice'

describe(Choice) do
  it { should validate_presence_of :url }
  it { should validate_presence_of :weight }
  it { should validate_numericality_of :weight }
end
