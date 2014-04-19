require 'user_choice'

describe(UserChoice) do
  it { should validate_presence_of :user_id }
  it { should validate_numericality_of :user_id }
  it { should validate_presence_of :choice }

  let (:test) { Test.crete(name: 'A/B test', choices: [choice1, choice2]) }
  let(:choice1) { Choice.create(url: 'http://google.com', weight: 2)}
  let(:choice2) { Choice.create(url: 'http://yahoo.com', weight: 1)}

  it 'should validate uniqueness of choice for a given user' do
    choice = UserChoice.create({ user_id: 1, choice: choice1 })
    choice.should be_valid

    choice = UserChoice.create({ user_id: 1, choice: choice2 })
    choice.should_not be_valid
  end
end
