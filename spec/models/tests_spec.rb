require 'test'

describe(Test) do
  it { should validate_presence_of(:name).with_message(/You must specify a name for the test/) }
  it { should validate_uniqueness_of(:name).with_message(/A test with this name already exists/) }
  it { should validate_presence_of(:choices).with_message(/Each test must have 2 choices/) }

  it 'should validate 2 choices' do
    test = Test.create(name: 'foo')
    test.errors.messages[:choices].should include('Each test must have 2 choices')
  end
end
