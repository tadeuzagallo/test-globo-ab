FactoryGirl.define do
  factory :test do
    sequence(:name) { |n| "ab_test_#{n}" }

    after(:build) do |test|
      2.times do 
        test.choices << FactoryGirl.create(:choice)
      end
    end
  end
end
