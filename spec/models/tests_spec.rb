require 'test'

describe(Test) do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :choices }

  it 'should validate 2 choices' do
    test = Test.create(name: 'foo')
    test.errors.messages[:choices].should include('is the wrong length (should be 2 characters)')
  end
end
