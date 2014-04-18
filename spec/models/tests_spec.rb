require 'test'

describe(Test) do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :choices }

  it 'should validate 2 choices' do
    test = Test.new(name: 'foo')
    choice = { url: 'foo', weight: 1 }

    test.choices.build(choice)
    test.valid?.should be_false

    test.choices.build(choice)
    test.valid?.should be_true

    test.choices.build(choice)
    test.valid?.should be_false
  end
end
