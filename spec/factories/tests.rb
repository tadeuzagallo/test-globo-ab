FactoryGirl.define do
  factory :test do
    sequence(:name) { |n| "ab_test_#{n}" }

    trait(:with_choices) do
      after(:build) do |test|
        2.times { test.choices << FactoryGirl.create(:choice) }
      end
    end
  end
end
