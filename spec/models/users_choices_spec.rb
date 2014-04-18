require 'user_choice'

describe(UserChoice) do
  it { should validate_presence_of :user_id }
  it { should validate_numericality_of :user_id }
end
