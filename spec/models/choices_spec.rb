require 'choice'

describe(Choice) do
  it { should validate_presence_of :url }
  it { should validate_presence_of :weight }
  it { should validate_numericality_of :weight }
  it { should allow_value('http://foo.com', 'http://bar.com.br/baz').for(:url) }
  it { should_not allow_value('bar.com').for(:url) }
end
