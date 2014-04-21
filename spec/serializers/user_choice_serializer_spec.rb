require 'user_choice_serializer'

describe(UserChoiceSerializer) do
  let(:test) { FactoryGirl.create(:test, :with_choices) }
  let(:choice) { test.choices.first }
  let(:user_choice) { FactoryGirl.create(:user_choice, choice: choice) }
  let(:serializer) { UserChoiceSerializer.new(user_choice) }
  subject { serializer.attributes }

  it { should have_key(:result) }

  it 'should have the choice url as result' do
    serializer.result.should == choice.url
  end
end
