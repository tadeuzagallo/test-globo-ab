FactoryGirl.define do
  factory :user_choice do
    sequence(:user_id) { |n| n }
    choice
  end
end
