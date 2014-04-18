require 'test'

describe(Test) do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :choices }

  it 'should validate 2 choices' do
    test = Test.new(name: 'foo')

    test.choices.build(url: 'bar')
    test.valid?.should be_false

    test.choices.build(url: 'baz')
    test.valid?.should be_true

    test.choices.build(url: 'blz')
    test.valid?.should be_false
  end
end
